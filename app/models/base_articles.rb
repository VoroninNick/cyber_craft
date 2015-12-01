module BaseArticles
  def create_article_table
    super

    connection.change_table self.table_name do |t|
      t.has_attached_file :index_logo
    end
  end

  def acts_as_article
    super
    [:index_logo].each do |attachment_name|
      has_attached_file attachment_name
      do_not_validate_attachment_file_type attachment_name
      attr_accessible attachment_name
    end
  end
end