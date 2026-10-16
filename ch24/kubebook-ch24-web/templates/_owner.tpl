{{- define "kubebook-ch24-web.owner" -}}
{{- printf "team-%s" .Values.labels.team }}
{{- end }}
