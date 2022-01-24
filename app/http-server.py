from wsgiref.simple_server import make_server
import socket

interface = "0.0.0.0"
port = 80


def app(environ, start_response):
    hostname = socket.gethostname()
    start_response('200 OK', [('Content-Type', 'text/html')])
    yield b"<h1>Goodbye World from {0}!</h1>".format(hostname)


server = make_server(interface, port, app)
server.serve_forever()
