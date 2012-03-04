def urlToString(url)
  require 'net/http'
  uri = URI(url)
  data = Net::HTTP.get(uri)
  return data
end

def writeToFile(image_url, directory_name)
  require 'open-uri'
  file_name = image_url[0][31..48]
  puts image_url[0][31..48]
  
  open("#{directory_name}/#{file_name}", 'wb') do |file|
    file << open(image_url.first).read
  end
end

def createDirectory
  directory_name = "images_#{Time.now.to_f}"
  Dir.mkdir("./#{directory_name}")
  return directory_name
end

def whichBoard(html_content, url)
  if url["/a/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[a]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/b/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[b]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/c/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[c]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/d/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[d]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/e/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[e]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/f/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[f]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/g/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[g]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/gif/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[gif]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/h/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[h]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/hr/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[hr]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/k/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[k]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/m/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[m]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/o/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[o]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/p/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[p]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/r/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[r]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/s/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[s]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/t/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[t]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/u/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[u]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/v/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[v]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/vg/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[vg]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/w/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[w]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/wg/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[wg]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/i/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[i]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/ic/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[ic]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/r9k/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[r9k]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/cm/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[cm]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/y/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[y]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/3/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[3]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/adv/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[adv]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/an/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[an]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/cgl/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[cgl]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/ck/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[ck]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/co/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[co]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/diy/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[diy]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/fa/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[fa]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/fit/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[fit]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/hc/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[hc]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/hm/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[hm]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/int/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[int]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/jp/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[jp]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/lit/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[lit]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/mlp/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[mlp]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/mu/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[mu]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/n/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[n]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/po/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[po]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/pol/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[pol]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/sci/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[sci]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/soc/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[soc]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/sp/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[sp]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/tg/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[tg]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/toy/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[toy]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/trv/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[trv]{3}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/tv/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[tv]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/vp/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[vp]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/x/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[x]{1}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  elsif url["/rs/"] != nil
    return html_content.scan(/([http]{4}...[images]{6}.[4chan]{5}.[org]{3}.[rs]{2}.[src]{3}.[0-9]{13}.[jpg|png|jpeg|gif]{3,4})/)
  end
end

def main(url)
  html_content = urlToString(url)
  occurances = whichBoard(html_content, url)
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
      puts i+1 # number stars from 1 instead of 0
      writeToFile(result[i], directory_name)
    end
    sleep 2 #seconds
  end
end
  
ARGV.each do |url|
  main(url)
end
