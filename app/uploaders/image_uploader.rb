# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  version :thumb do
    process :resize_to_limit => [150, 130]
  end
end
