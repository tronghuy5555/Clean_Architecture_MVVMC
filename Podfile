# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'

def rx_install
  pod 'RxSwift', '~> 6.6'
  pod 'RxCocoa', '~> 6.6'
  pod 'Swinject'
  pod 'Swinject-CodeGen'
end

target 'Clean_Architecture_MVVMC' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Clean_Architecture_MVVMC
  pod 'SwiftGen', '~> 6.0'
  pod 'Alamofire', '~> 5.8'
  rx_install
  target 'Clean_Architecture_MVVMCTests' do
    inherit! :search_paths
    # Pods for testing
    rx_install
    pod 'RxTest', '~> 6.6'
    pod 'RxBlocking', '~> 6.6'
  end

  target 'Clean_Architecture_MVVMCUITests' do
    # Pods for testing
  end
    
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
end


