Pod::Spec.new do |spec|
  spec.name = "Panda_Mobile_Encrypt_OC"
  spec.version = "0.0.1"
  spec.summary = "An Encrypt library for IOS Objective-C."
  spec.homepage = "https://github.com/lingen/Panda_Mobile_Encrypt_OC.git"
  spec.license = { type: 'ALV2', file: 'LICENSE' }
  spec.authors = { "lingen.liu" => 'lingen.liu@gmail.com' }
  spec.social_media_url = "http://lingenliu.com"

  spec.platform = :ios, "8.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/lingen/Panda_Mobile_Encrypt_OC.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "Panda_Mobile_Encrypt_OC/**/*.{h,m}"

end