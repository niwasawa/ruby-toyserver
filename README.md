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

