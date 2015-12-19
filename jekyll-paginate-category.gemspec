# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-paginate-category/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-paginate-category"
  spec.version       = Jekyll::Paginate::Category::VERSION
  spec.authors       = ["midnightSuyama"]
  spec.email         = ["midnightSuyama@gmail.com"]
  spec.summary       = "Pagination Generator for Jekyll Category"
  spec.description   = "Pagination Generator for Jekyll Category"
  spec.homepage      = "https://github.com/midnightSuyama/jekyll-paginate-category"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "jekyll", ">= 2.0"
  spec.add_development_dependency "jekyll-paginate", "~> 1.1"
end
