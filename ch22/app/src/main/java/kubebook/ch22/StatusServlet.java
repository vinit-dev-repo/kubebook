package kubebook.ch22;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.GetResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.spy.memcached.MemcachedClient;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.InetSocketAddress;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

@WebServlet({"/", "/status", "/ping"})
public class StatusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Properties p = new Properties();
        try (InputStream in = getClass().getResourceAsStream("/application.properties")) {
            p.load(in);
        }
        resp.setContentType("text/plain");
        PrintWriter out = resp.getWriter();

        try { Class.forName("com.mysql.cj.jdbc.Driver"); } catch (ClassNotFoundException e) { out.println("db: driver missing"); }
        String url = "jdbc:mysql://" + p.getProperty("db.host") + ":3306/" + p.getProperty("db.name");
        if ("/ping".equals(req.getServletPath())) {
            try (java.sql.Connection c = DriverManager.getConnection(url, p.getProperty("db.user"), System.getenv("DB_PASSWORD"))) {
                out.println("db ready");
            } catch (Exception e) {
                resp.setStatus(503);
                out.println("db not ready");
            }
            return;
        }
        try (java.sql.Connection c = DriverManager.getConnection(url, p.getProperty("db.user"), System.getenv("DB_PASSWORD"));
             Statement s = c.createStatement();
             ResultSet r = s.executeQuery("SELECT name FROM items ORDER BY id LIMIT 1")) {
            r.next();
            out.println("db: " + r.getString(1));
        } catch (Exception e) {
            out.println("db: error " + e.getMessage());
        }

        MemcachedClient mc = null;
        try {
            mc = new MemcachedClient(new InetSocketAddress(p.getProperty("cache.host"), 11211));
            Object v = mc.get("greeting");
            if (v == null) {
                mc.set("greeting", 60, "hello from memcached").get();
                out.println("cache: miss, stored");
            } else {
                out.println("cache: hit, " + v);
            }
        } catch (Exception e) {
            out.println("cache: error " + e.getMessage());
        } finally {
            if (mc != null) mc.shutdown(0, TimeUnit.SECONDS);
        }

        try {
            ConnectionFactory f = new ConnectionFactory();
            f.setHost(p.getProperty("queue.host"));
            f.setUsername(p.getProperty("queue.user"));
            f.setPassword(System.getenv("QUEUE_PASSWORD"));
            try (com.rabbitmq.client.Connection qc = f.newConnection(); Channel ch = qc.createChannel()) {
                ch.queueDeclare("kubebook", false, false, false, null);
                ch.basicPublish("", "kubebook", null, "hello from rabbitmq".getBytes());
                GetResponse g = ch.basicGet("kubebook", true);
                out.println("queue: " + (g == null ? "empty" : new String(g.getBody())));
            }
        } catch (Exception e) {
            out.println("queue: error " + e.getMessage());
        }
    }
}
