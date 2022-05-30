while [[ $(kubectl get NetworkChaos -o 'jsonpath={..action}') != "delay" ]]; do echo "Waiting for chaos applying" && sleep 10; done

