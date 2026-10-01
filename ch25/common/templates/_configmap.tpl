{{- define "common.configmap" -}}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-{{ .Chart.Name }}
  labels:
    app.kubernetes.io/managed-by: {{ .Release.Service }}
data:
  {{- toYaml .Values.settings | nindent 2 }}
{{- end }}
