Pod::Spec.new do |s|
  s.name             = 'SwiftDependancyResolver'
  s.version          = '1.0'
  s.summary          = 'A super small dependency resolver written in Swift 3.0'
 
  s.description      = <<-DESC
A super small dependency resolver written in Swift 3.0
                       DESC
 
  s.homepage         = 'https://github.com/chrismsimpson/SwiftDependancyResolver'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Chris Simpson' => 'chris.m.simpson@icloud.com' }
  s.source           = { :git => 'https://github.com/chrismsimpson/SwiftDependancyResolver.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'SwiftDependancyResolver/DependancyResolver.swift'
 
end
