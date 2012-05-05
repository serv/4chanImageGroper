#!/usr/bin/env ruby

require 'nokogiri'
require 'fileutils'
require 'net/http'
require 'uri'
require 'open-uri'

class FourChan

  def list_images(url)
    nok = Nokogiri::HTML( open(url).read )
    images = []
    nok.xpath("//a[@target='_blank']").each do |el|
      images.push el.attr('href') if el.attr('href') =~ /images\.4chan\.org/i
    end
    images.uniq!
    STDERR.puts "There are #{images.count} images to download."
    images
  end

  def download_images(thread_url, dir='.')
    self.list_images(thread_url).each do |image_url|
      uri       = URI("http:#{image_url}")
      file_name = image_url.split("/").last
      next if File.exists? "#{dir}/#{file_name}"
      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri.request_uri
        STDERR.puts "Saving: #{dir}/#{file_name}"
        http.request request do |response|
          open "#{dir}/#{file_name}", 'w' do |io|
            response.read_body do |chunk|
              io.write chunk
            end
          end
        end
        sleep 3
      end
    end
  end
end

def usage(msg)
  STDERR.puts "Error: #{msg}" if msg
  STDERR.puts "image_crawler.rb <destination directory> <thread url> [additional thread urls]"
  exit 1
end

usage("Missing arguments.") if ARGV.length < 2
dir = ARGV.shift
usage("You must specify a destination directory as the first argument.") if dir =~ /^http/i
usage("Second argument doesn't look like a thread url.") unless ARGV[0] =~ /http/i
FileUtils.mkdir_p dir unless Dir.exists? dir
FourChan.new.download_images(ARGV.shift, dir)
