import subprocess
import logging
import os
import http.server
import socketserver


class MyHttpRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        logging.info("received a request")
        try:
            subprocess.check_call(["/bin/sh", "script.sh"])
        except subprocess.CalledProcessError as e:
            logging.error("error running script: %s", e)


logging.basicConfig(level=logging.INFO)

PORT = int(os.environ.get("PORT", 8080))
logging.info("starting server on port %s", PORT)

Handler = MyHttpRequestHandler
httpd = socketserver.TCPServer(("", PORT), Handler)
logging.info("serving at port %s", PORT)

try:
    httpd.serve_forever()
except KeyboardInterrupt:
    pass

httpd.server_close()
logging.info("server stopped")
