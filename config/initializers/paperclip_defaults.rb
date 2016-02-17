# interpolate in paperclip
Paperclip.interpolates :public_path  do |attachment, style|
    Rails.public_path
end

Paperclip::Attachment.default_options.merge!(
    processors: [:thumbnail, :paperclip_optimizer],
    path: ":public_path/system/:class/:attachment/:id_partition/:style/:filename"
)