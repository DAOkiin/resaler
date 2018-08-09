if Rails.env.development?
  require 'byebug/core'

  def find_available_port
    server = TCPServer.new(nil, 0)
    server.addr[1]
  ensure
    server.close if server
  end

  port = find_available_port
  Byebug.start_server('localhost', port)
  puts "Remote debugger on port #{port}"
end
