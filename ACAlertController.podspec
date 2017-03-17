Pod::Spec.new do |s|

  s.name         = "ACAlertController"
  s.version      = "1.0.0"
  s.summary      = "At iOS 8.0 later, we use UIAlertController, it's not friendly, so we  replace it with ACAlertController."

  s.homepage     = "https://github.com/honeycao/ACAlertController"

  s.license      = "MIT"

  s.author       = { "ArthurCao" => "honeycao9268@163.com" }
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/honeycao/ACAlertController.git", :tag => "#{s.version}" }

  s.source_files = "ACAlertController/**/*.{h,m}"

  s.framework    = "UIKit"

  s.requires_arc = true

end
