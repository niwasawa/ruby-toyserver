require 'webrick'
require 'cgi'
require 'json'

class ToyServer

  def start()

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

      # headers
      headers = res.header
      headers['content-type'] = 'text/html'
      if req.query.include?('headers')
        JSON.parse(req.query['headers']).each do |key, val|
          headers[key] = val
        end
      end

      # response body
      body = "<html><body>\n"
      body += "#{CGI.escapeHTML(req.request_line)}"
      body += "<br>#{CGI.escapeHTML(req.body)}\n" if req.body
      body += "</body></html>\n"
      if req.query.include?('body')
        body = req.query['body']
      end

      # wait
      if req.query.include?('wait')
        sleep(req.query['wait'].to_i)
      end

      # return response
      res.status = status
      res.body = body
    end

    Signal.trap('INT'){server.shutdown}
    server.start
  end

end

ToyServer.new.start

