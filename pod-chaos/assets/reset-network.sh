kill $(lsof -t -i:8082) >/dev/null 2>&1 || true
nohup kubectl port-forward --address 0.0.0.0 svc/buddy-front-door 8082:8082 >/dev/null 2>&1 &