Paperclip::Attachment.default_options.merge!(
    processors: [:thumbnail, :paperclip_optimizer]
)