module Opt
  def self.models
    models = Dir[Rails.root.join("app/models/*.rb")].map {|f| name = f.split("/").last.gsub(/\.rb\Z/, "").camelize.constantize }.select{|a| a.instance_of?(Class) && a.superclass == ActiveRecord::Base }
  end
  def self.reprocess_images
    Paperclip.options[:log] = false
    (models + Pages.all).each do |model|
      puts "model: #{model.name}"
      model.logger = nil
      names = model.try(:attachment_definitions)
      if names.try(:any?)
        names.each do |name, attachment_definition|
          model.all.each do |item|
            attachment = item.send(name)
            if attachment.exists?
              attachment.styles.each do |style_name, style_definition|
                attachment.reprocess!(style_name)
              end
            end
          end
        end
      end
    end
  end
end