# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rx_install
  pod 'RxSwift', '~> 6.6'
  pod 'RxCocoa', '~> 6.6'
  pod 'Swinject'
  pod 'Swinject-CodeGen'
  pod 'SwinjectStoryboard'
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
  end

  target 'Clean_Architecture_MVVMCUITests' do
    # Pods for testing
  end
    
end


