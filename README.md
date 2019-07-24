# ToyServer
ToyServer is a web server with Ruby.

## Start web server (with WEBrick)

```ruby
$ ruby toyserver.rb
```

## Access to ToyServer

### No parameters

```
$ curl --dump-header - http://localhost:8000/
HTTP/1.1 200 OK 
Content-Type: text/html
Server: WEBrick/1.4.2 (Ruby/2.6.3/2019-04-16)
Date: Thu, 27 Jun 2019 22:41:46 GMT
Content-Length: 44
Connection: Keep-Alive

<html><body>
GET / HTTP/1.1
</body></html>
```

### Response status code

```
$ curl --dump-header - http://localhost:8000/?status=500
HTTP/1.1 500 Internal Server Error 
Content-Type: text/html
Server: WEBrick/1.4.2 (Ruby/2.6.3/2019-04-16)
Date: Thu, 27 Jun 2019 22:41:50 GMT
Content-Length: 55
Connection: Keep-Alive

<html><body>
GET /?status=500 HTTP/1.1
</body></html>
```

### Response headers and body

- headers={"result":"OK"}
- body={"content-type":"application/json"}

```
$ curl --dump-header - "http://localhost:8000/?headers=%7B%22content-type%22%3A%22application%2Fjson%22%7D&body=%7B%22result%22%3A%22OK%22%7D"
HTTP/1.1 200 OK 
Content-Type: application/json
Server: WEBrick/1.4.2 (Ruby/2.6.3/2019-04-16)
Date: Wed, 24 Jul 2019 12:22:47 GMT
Content-Length: 15
Connection: Keep-Alive

{"result":"OK"}
```

### The seconds to wait

```
$ date -u -R; curl --dump-header - http://localhost:8000/?wait=10
Thu, 27 Jun 2019 22:41:58 +0000
HTTP/1.1 200 OK 
Content-Type: text/html
Server: WEBrick/1.4.2 (Ruby/2.6.3/2019-04-16)
Date: Thu, 27 Jun 2019 22:42:09 GMT
Content-Length: 52
Connection: Keep-Alive

<html><body>
GET /?wait=10 HTTP/1.1
</body></html>
```

