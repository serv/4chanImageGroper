def urlToString(url)
  require 'net/http'
  uri = URI(url)
  data = Net::HTTP.get(uri)
  return data
end

def writeToFile(image_url, directory_name)
  require 'open-uri'
  file_name = image_url[-17..-1]
  puts image_url[-17..-1]
  open("#{directory_name}/#{file_name}", 'wb') do |file|
    file << open(image_url).read
  end
end

def createDirectory
  directory_name = "images_#{Time.now.to_f}"
  Dir.mkdir("./#{directory_name}")
  return directory_name
end

def main(url)
  html_content = urlToString(url)
  occurances = html_content.scan(/\/\/images\.4chan\.org\/.*?\/src\/\d+\.[jpg|jpeg|gif|png]{3,4}/)
  occurances.map! { |incomplete_url| "http:" + incomplete_url }
  result = []
  (0..occurances.count-1).each do |i|
    if i%2 == 0
      result << occurances[i]
    end
  end
  puts result
  puts "There are #{result.count} images to download."
  
  directory_name = createDirectory
  
  (0..result.count).each do |i|
    if result[i] != nil
      puts i+1 # number starts from 1 instead of 0
      writeToFile(result[i], directory_name)
    end
    sleep 2 #seconds
  end
end
  
ARGV.each do |url|
  main(url)
end