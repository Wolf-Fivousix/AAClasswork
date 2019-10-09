require 'rack'
require "byebug"

# Rack::Server.start(
#   app: Proc.new do |env|
#     ['200', {'Content-Type' => 'text/html'}, ['hello world']]
#   end
#   Port: 3000
# )


milkshake = Proc.new do |env|
  request = Rack::Request.new(env)
  response = Rack::Response.new
  response['Content-Type'] = 'text/html'
  if request.path.start_with?("/aa/")
    response.write(request.path)
  else
    response.write("Chocolate Delicious Cold Thingy\n")
    response.write("    #{env['REQUEST_PATH']}")
    response.write("    #{env['PATH_INFO']}")
  end
  response.finish
end

Rack::Server.start(
  app: milkshake,
  Port: 3000
)