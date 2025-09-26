Pod::Spec.new do |s|
  s.name                        = "NTP"
  s.version                     = "1.2.1"
  s.summary                     = "A simple NTP client written in swift"
  s.license                     = { :type => "MIT", :file => "LICENSE" }
  s.homepage                    = "https://github.com/danielepantaleone/NTP.swift"
  s.authors                     = { "Daniele Pantaleone" => "danielepantaleone@me.com" }
  s.ios.deployment_target       = "12.0"
  s.osx.deployment_target       = "12.0"
  s.source                      = { :git => "https://github.com/danielepantaleone/NTP.swift.git", :tag => "#{s.version}" }
  s.source_files                = "Sources/NTP/**/*.swift"
  s.swift_version               = "5.9"
end
