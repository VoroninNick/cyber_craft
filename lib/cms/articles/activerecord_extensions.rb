module Cms
  module Articles
    module ActiveRecordExtensions
      module ClassMethods


        def acts_as_article options = {}
          #attr_accessor :acts_as_article_options
          #self.acts_as_article_options = options
          class_variable_set(:@@acts_as_article_options, options)
          if mod = options[:base_articles]
            self.send(:extend, mod)
          end

          belongs_to :author, class_name: User
          attr_accessible :author

          self.attr_accessible *attribute_names
          initialize_all_attachments = false
          attachment_names = [:avatar]

          if initialize_all_attachments
            attachment_names = paperclip_attachment_names_from_columns
          end

          if attachment_names.try(&:any?)
            attachment_names.each do |attachment_name|
              has_attached_file attachment_name
              do_not_validate_attachment_file_type attachment_name
              attr_accessible attachment_name
            end
          end

          scope :published, -> { where(published: true) }

          if options[:tags]
            acts_as_taggable

            attr_accessible :tag_list
          end
        end

        def acts_as_article_options
          opts = class_variable_get(:@@acts_as_article_options) || {}

        end

        def paperclip_suffixes
          %w(_file_name _content_type _file_size _updated_at)
        end

        def paperclip_attachment_names_from_columns
          return nil unless self.table_exists?


          matched_columns = self.column_names.sort.select{ |c|
            matches = false
            paperclip_suffixes.each do |s|
              res = c.ends_with?(s)
              #next false if !res

              if res
                matches = true
                break
              end
            end

            next matches
          }

          return matched_columns.map{|c|
            c.gsub(/#{paperclip_suffixes.join("|")}/, "")
          }.uniq
        end

        def create_article_table
          return if self.table_exists?

          connection.create_table self.table_name do |t|
            t.boolean :published
            t.string :name
            t.text :content
            t.string :url_fragment
            t.has_attached_file :avatar

            t.belongs_to :author

            t.timestamps null: false
          end
        end

        def drop_article_table
          return unless self.table_exists?

          connection.drop_table self.table_name
        end
      end
    end
  end
end


ActiveRecord::Base.send(:extend, Cms::Articles::ActiveRecordExtensions::ClassMethods)