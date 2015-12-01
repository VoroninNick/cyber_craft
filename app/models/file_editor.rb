class FileEditor
  include ActiveRecord::Callbacks
  attr_accessor :file_name
  attr_accessor :file_content

  after_save :save_file




  def save_file
    f = File.open(file_name)
    f.write("")
    f.save
  end

end