{{- define "app.labels" -}}
app: spring-boot-app
env: {{ .Values.image.env }}
{{- end  -}}