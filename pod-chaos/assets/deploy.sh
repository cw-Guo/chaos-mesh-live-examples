kubectl apply -f ./app
while [[ $(kubectl get pods -l app=buddy-service -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do echo "Waiting for pod running" && sleep 10; done
kill $(lsof -t -i:8082) >/dev/null 2>&1 || true
nohup kubectl port-forward --address 0.0.0.0 svc/buddy-front-door 8082:8082 >/dev/null 2>&1 &