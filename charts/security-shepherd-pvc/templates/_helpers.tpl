{{/*
Expand the name of the chart.
*/}}
{{- define "security-shepherd-pvc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "security-shepherd-pvc.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "security-shepherd-pvc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "security-shepherd-pvc.labels" -}}
helm.sh/chart: {{ include "security-shepherd-pvc.chart" . }}
{{ include "security-shepherd-pvc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "security-shepherd-pvc-mysql.labels" -}}
helm.sh/chart: {{ include "security-shepherd-pvc.chart" . }}
app: {{ include "security-shepherd-pvc.name" . }}-mysql
{{ include "security-shepherd-pvc-mysql.selectorLabels" . }}
{{- if .Chart.AppVersion }}
version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "security-shepherd-pvc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "security-shepherd-pvc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "security-shepherd-pvc-mysql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "security-shepherd-pvc.name" . }}-mysql
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
