require 'spec_helper'

describe FourchanImageGroper::Request, '#initialize' do
  it 'returns a Request object' do 
    request = FourchanImageGroper::Request.new('http://boards.4chan.org/b/res/489537693')
    request.class.name.should == 'FourchanImageGroper::Request'
  end
  
  it 'has right attributes' do 
    request = FourchanImageGroper::Request.new('http://boards.4chan.org/b/res/489537693')
    request.url.should == 'http://boards.4chan.org/b/res/489537693'
    request.thread_id.should == 489537693
    request.board.should == 'b'
  end
end

describe FourchanImageGroper::Request, '#jsonify' do 
  it 'should have a right json url' do
    request = FourchanImageGroper::Request.new('http://boards.4chan.org/fa/res/6408233')
    request.jsonify.should == 'http://api.4chan.org/fa/res/6408233.json'
  end
end

describe FourchanImageGroper::Request, '#images' do 
  it 'returns an array' do
    request = FourchanImageGroper::Request.new('http://boards.4chan.org/fa/res/6408233')
    request.images.class.name.should == 'Array'
  end
end