Pod::Spec.new do |s|
  s.name         = "XJsonObject"
  s.version      = "1.0.1"
  s.summary      = "可以将数组或键值对映射成本地对象，主要用于对象序列化和网络数据解析
                数据模型和字典互转"
  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/BerXiu/XJsonObject"
  s.platform = :ios, "7.0"
  s.license      = "MIT"
  s.author             = { "Xiu" => "xiuber@icloud.com" }
  s.source       = { 
	:git => "https://github.com/BerXiu/XJsonObject.git", 
	:tag => s.version
  }
  s.source_files  = "Classes", "XJsonObject/XJsonObject/*.{h,m}"
  s.requires_arc = true
  s.framework = "UIKit"
end
