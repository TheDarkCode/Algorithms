Pod::Spec.new do |s|
  s.name             = "Algorithms"
  s.version          = "0.0.1"
  s.summary          = "Collection of algorithms and data structures written in Swift 2.x."
  s.homepage         = "https://github.com/TheDarkCode/Algorithms"
  s.license          = 'MIT'
  s.author           = { "Mark Hamilton" => "mark@dryverless.com" }
  s.source           = { :git => "https://github.com/TheDarkCode/Algorithms.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dryverless'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

end
