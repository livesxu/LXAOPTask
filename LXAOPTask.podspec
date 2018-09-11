
Pod::Spec.new do |s|

  s.name         = "LXAOPTask"
  s.version      = "0.1.0"
  s.summary      = "LXAOPTask"
  s.homepage     = "https://github.com/livesxu/LXAOPTask.git"
  s.license      = "MIT"
  s.author       = { "livesxu" => "livesxu@163.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/livesxu/LXAOPTask.git", :tag => s.version }
  s.source_files  = "LXAOPTask"
  s.frameworks    = 'UIKit'
  s.requires_arc  = true

  s.dependency 'Aspects', '~> 1.4.1'

end