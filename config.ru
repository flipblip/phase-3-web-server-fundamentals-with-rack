require 'rack'
require 'pry'

class App
  def call(env)
    path = env["PATH_INFO"]

    if path == "/"
      [200, { "Content-Type" => "text/html" }, ["<h2>Hello <em>World</em>!</h2>"]]
    elsif path == "/potato"
      [200, { "Content-Type" => "text/html" }, ["<p>Boil 'em, mash 'em, stick 'em in a stew</p>"]]
    else
      [404, { "Content-Type" => "text/html" }, ["Page not found"]]
    end
  end
end

run App.new


# rackup config.ru

# [2022-11-15 20:03:22] INFO  WEBrick 1.7.0
# [2022-11-15 20:03:22] INFO  ruby 2.7.4 (2021-07-07) [x86_64-linux]
# [2022-11-15 20:03:22] INFO  WEBrick::HTTPServer#start: pid=16252 port=9292

# WEBrick is a Ruby library that provides a simple HTTP server. Rack needs a web server to handle connections, and WEBrick is the default since it's included with Ruby. Later, we'll be replacing this with another more powerful Ruby server, Thin.