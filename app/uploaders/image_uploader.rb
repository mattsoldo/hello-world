class ImageUploader < Shrine
  plugin :determine_mime_type
  plugin :pretty_location
end

# class AttachmentUploader < CarrierWave::Uploader::Base
#   storage :fog
#
#   # def store_dir
#   #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
#   # end
#
#   def extension_white_list
#     %w(jpg jpeg png gif)
#   end
# end
