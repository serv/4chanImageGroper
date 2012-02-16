def urlToString(url)
  require 'net/http'
  uri = URI(url)
  data = Net::HTTP.get(uri)
  return data
end

def writeToFile(image_url)
  require 'open-uri'
  file_name = image_url[0][31..48]
  puts image_url[0][31..48]
  open("images/#{file_name}", 'wb') do |file|
    file << open(image_url.first).read
  end
end

def main(url)
  html_content = urlToString(url)
  occurances = html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[b]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  result = []
  (0..occurances.count-1).each do |i|
    if i%2 == 0
      result << occurances[i]
    end
  end
  puts result
  puts "There are #{result.count} images to download."
  
  (0..result.count).each do |i|
    if result[i] != nil
      puts i
      writeToFile(result[i])
    end
    sleep 2 #seconds
  end
  
  # result.each do |image_url|
  #     writeToFile(image_url)
  # end
end
  
ARGV.each do |url|
  main(url)
end
