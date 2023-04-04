import subprocess
import logging
import os
import http.server
import socketserver


class MyHttpRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        logging.info("received a request")
        try:
            subprocess.call(["/bin/sh", "script.sh"])
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(b'success')
        except subprocess.CalledProcessError as e:
            logging.error("error running script: %s", e)
            self.send_response(500)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(b'failure')


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