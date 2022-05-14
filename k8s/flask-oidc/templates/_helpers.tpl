{{/*
Translate the `secure` parameter to the relevant url
*/}}
{{- define "oidc.url" }}
{{- if .Values.oidc.hostname.secure }}
{{- printf "https://%s" .Values.oidc.hostname.name }}
{{- else }}
{{- print "http://%s" .Values.oidc.hostname.name }}
{{- end }}
{{- end }}

{{/*
Backend UID server service url
*/}}
{{- define "backend.url" -}}
{{- printf "http://%s.%s.svc.cluster.local:%s/id" .Values.backend.service.name .Release.Namespace (.Values.backend.service.port | toString) }}
{{- end }}

{{/*
Common labels - frontend
*/}}
{{- define "frontend.labels" -}}
{{ include "frontend.selectorLabels" . }}
{{- end }}

{{/*
Selector labels - frontend
*/}}
{{- define "frontend.selectorLabels" -}}
app: {{ .Values.frontend.service.name }}
{{- end }}

{{/*
Common labels - backend
*/}}
{{- define "backend.labels" -}}
{{ include "backend.selectorLabels" . }}
{{- end }}

{{/*
Selector labels - backend
*/}}
{{- define "backend.selectorLabels" -}}
app: {{ .Values.backend.service.name }}
{{- end }}