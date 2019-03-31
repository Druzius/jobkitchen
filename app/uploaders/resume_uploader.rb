class ResumeUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def extension_whitelist
    %w(pdf doc htm html docx)
  end
end
