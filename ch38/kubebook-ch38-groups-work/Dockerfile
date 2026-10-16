FROM busybox:1.37
LABEL kubebook.lab=kubebook-ch38-groups
RUN echo 'labuser:x:1000:3000:lab:/tmp:/bin/sh' >> /etc/passwd \
 && echo 'labprimary:x:3000:' >> /etc/group \
 && echo 'imageread:x:50000:labuser' >> /etc/group
USER 1000:3000
