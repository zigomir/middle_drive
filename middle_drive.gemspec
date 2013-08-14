# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middle_drive/version'

Gem::Specification.new do |spec|
  spec.name          = 'middle_drive'
  spec.version       = MiddleDrive::VERSION
  spec.authors       = ['Ziga Vidic']
  spec.email         = ['zigomir@gmail.com']
  spec.description   = %q{Integrate Middleman and Google Drive}
  spec.summary       = %q{Will sync Google Drive spreadsheets and images with Middleman to use it as CMS.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'google_drive'
end
