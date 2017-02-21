require 'open-uri'
require 'viddl-rb'
puts "aahhaannnn which song to download"
query = gets.chomp
query.gsub!(" ", "+")
base_url = open("https://www.youtube.com/results?search_query=#{query}").read
match_content = []
doc = Nokogiri::HTML(base_url)
links = doc.css('a')
hrefs = links.map {|link| link.attribute('href').to_s}.uniq.delete_if {|href| href.empty?}
match_content.push(hrefs.select{|x| x.match(/watch\?v=\w+/)})
download = ("https://www.youtube.com#{match_content[0][0]}")
cmd = `youtube-dl -x #{download}`
puts cmd
puts 'bye'