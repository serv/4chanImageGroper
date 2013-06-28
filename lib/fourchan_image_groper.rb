require "fourchan_image_groper/version"
require "fourchan-urler"
require 'open-uri'
require 'json'
require 'ostruct'

module FourchanImageGroper
  class Request
    attr_accessor :url, :board, :thread_id, :image_count
    
    def initialize(url)
      fourchan_url = FourchanUrler::Request.new(url)
      @url = url
      @board = fourchan_url.board
      @thread_id = fourchan_url.thread_id
    end
    
    def jsonify
      'http://api.4chan.org/' + self.board + '/res/' + self.thread_id.to_s + '.json'
    end
    
    def images
      list = []
      begin
        json = JSON.parse(open(self.jsonify).read)
        json['posts'].map do |post|
          return [] if post['images'] == 0 
          unless post['tim'].nil?
            image = Image.new(post) 
            image.board = self.board
            image.urlify
            list << image
          end
        end
        @image_count = list.count
        list
      rescue
        raise JSONError, 'JSON processing failed. Please try again.'
      end
    end
  end
  
  class Image
    attr_accessor :id, :extension, :parent, :url, :board
    
    def initialize(post)
      @id = post['tim'].to_i
      @extension = post['ext']
      @parent = post['no']
    end
    
    def urlify
      @url = "http://images.4chan.org/#{self.board}/src/#{self.id}#{self.extension}"
    end
  end
end