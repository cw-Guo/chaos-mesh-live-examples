while [[ $(kubectl get pods -l app=buddy-service -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') == "True True True" ]]; do echo "Waiting for pod failure" && sleep 10; done
sleep 20;