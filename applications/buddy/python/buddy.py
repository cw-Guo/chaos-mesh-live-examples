from flask import Flask
import socket

app = Flask(__name__)


@app.route("/buddy/list", methods=['GET'])
def listBuddy():
    ip_list = []
    ais = socket.getaddrinfo("buddy-list-service", 0, 0, 0, 0)
    for result in ais:
        ip_list.append(result[-1][0])
    ip_list = list(set(ip_list))
    return str(ip_list)


if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0')