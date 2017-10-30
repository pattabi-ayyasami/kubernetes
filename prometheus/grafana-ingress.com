apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: grafana
  namespace: monitoring
  annotations:
    kubernetes.io/ingress.class: "nginx"
    ingress.kubernetes.io/ssl-redirect: "true"
spec:
  rules:
  - host: do.grafana.com
    http:
      paths:
      - path: /
        backend:
          serviceName: grafana
          servicePort: 3000
