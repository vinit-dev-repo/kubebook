{{- define "kubebook-ch24-web.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- define "kubebook-ch24-web.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{ include "kubebook-ch24-web.selector" . }}
{{- end }}
{{- define "kubebook-ch24-web.selector" -}}
app: {{ include "kubebook-ch24-web.fullname" . }}
{{- end }}
