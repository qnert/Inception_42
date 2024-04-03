import http.server
import socketserver
import os

directory = '/var/www/html'

class handler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            with open(os.path.join(directory, 'index.html'), 'rb') as file:
                html_content = file.read()
            self.wfile.write(html_content)
        elif self.path == '/profile.jpg':
            self.send_response(200)
            self.send_header('Content-type', 'image/jpg')
            self.end_headers()
            with open(os.path.join(directory, 'profile.jpg'), 'rb') as file:
                html_content = file.read()
            self.wfile.write(html_content)
        else:
            self.send_response(404)
            self.send_header('Content-type', 'text/plain')
            self.end_headers()
            self.wfile.write(bytes("Error 404: Not Found", "utf-8"))

with socketserver.TCPServer(("", 8085), handler) as httpd:
    print("Server started at http://localhost:8085")
    httpd.serve_forever()
