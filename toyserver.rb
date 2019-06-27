require 'webrick'
require 'cgi'

server = WEBrick::HTTPServer.new(
  :Port => 8000,
  :HTTPVersion => WEBrick::HTTPVersion.new('1.1'),
  :AccessLog => [[open(IO::NULL, 'w'), '']] # don't output access log
)

server.mount_proc('/') do |req, res|

  # output request infomation
  puts "========== #{Time.new} =========="
  puts req.request_line
  puts ''
  puts req.raw_header
  puts "\n#{req.body}" if req.body

  # status
  status = 200
  if req.query.include?('status')
    status = req.query['status'].to_i
  end

  # wait
  if req.query.include?('wait')
    sleep(req.query['wait'].to_i)
  end

  # create response body
  body = "<html><body>\n"
  body += "#{CGI.escapeHTML(req.request_line)}"
  body += "<br>#{CGI.escapeHTML(req.body)}\n" if req.body
  body += "</body></html>\n"

  # return response
  res.status = status
  res['content-type'] = 'text/html'
  res.body = body
end

Signal.trap('INT'){server.shutdown}
server.start

