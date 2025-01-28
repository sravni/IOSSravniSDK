Pod::Spec.new do |s|
  s.name             = 'SravniSDK'
  s.version          = '1.0.174'
  s.summary          = 'SravniSDK'
  s.description      = <<-DESC
Sravni SDK разработано специально для того, чтобы упростить интеграцию пользовательского флоу компании. Оно позволяет запускать его нативно, напрямую из родительского приложения, тем самым предоставляя конечным пользователям бесшовный доступ к сервису.
Используя наш SDK, вы можете легко добавить функциональность нашей компании в свое приложение без значительных изменений в существующем коде.
                       DESC

  s.homepage         = 'https://github.com/sravni/IOSSravniSDK'
  s.license          = { :type => 'Copyright', :text => 'Copyright 2025 Sravni' }
  s.author           = 'Sravni Team'
  s.swift_version    = '5.9'
  s.platform         = :ios, '14.0'
  s.requires_arc     = true
  s.source           = { :http => 'https://github.com/sravni/IOSSravniSDK/releases/download/1.0.174/SravniSDK.xcframework.zip' }
  s.ios.deployment_target = '14.0'
  s.ios.vendored_frameworks = 'SravniSDK.xcframework'

end
