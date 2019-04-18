lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Ruby_Bowling"
  spec.version       = '1.0'
  spec.license       = "MIT"

  spec.files         = ['lib/bowling.rb']
  spec.executables   = ['bin/bowling']
  spec.test_files    = ['spec/spec*.rb']
  spec.require_paths = ["lib"]
end