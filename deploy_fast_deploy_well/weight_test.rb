#!/usr/bin/ruby
webserver = {}
webserver['38-web-01'] = 0
webserver['38-web-02'] = 0
100.times do
  result=`curl -s http://54.82.196.173/loadbalancer.html`
  if result.include?('38-web-02')
    webserver['38-web-02'] += 1
  else
    webserver['38-web-01'] += 1
  end
end

puts webserver.inspect