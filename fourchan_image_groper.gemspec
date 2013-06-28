# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fourchan_image_groper/version'

Gem::Specification.new do |spec|
  spec.name          = "fourchan_image_groper"
  spec.version       = FourchanImageGroper::VERSION
  spec.authors       = ["Jason Kim"]
  spec.email         = ["iamjsonkim@gmail.com"]
  spec.description   = %q{FouchanImageGroper is a image crawler that grabs all the images in a thread and saves them on your computer. Images with jpeg, jpg, png and gif extension are supported. All image boards are supported.}
  spec.summary       = %q{FouchanImageGroper is a image crawler that grabs all the images in a thread and saves them on your computer.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.homepage      = 'https://github.com/serv/4chanImageGroper'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
