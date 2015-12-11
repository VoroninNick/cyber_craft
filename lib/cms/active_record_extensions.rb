
module Cms
  module ActiveRecordExtensions
    extend ActiveSupport::Concern

    module ClassMethods

      def has_seo_tags
        has_one :seo_tags, class_name: "Cms::MetaTags", as: :page, autosave: true
        accepts_nested_attributes_for :seo_tags
        attr_accessible :seo_tags, :seo_tags_attributes
      end

      # def has_sitemap_record
      #   has_one :sitemap_record, as: :sitemap_resource
      #   attr_accessible :sitemap_record
      # end




      def has_sitemap_record
        has_one :sitemap_record, class_name: "Cms::SitemapElement", as: :page
        accepts_nested_attributes_for :sitemap_record
        attr_accessible :sitemap_record, :sitemap_record_attributes
      end

      def reload_routes
        DynamicRouter.reload
      end

      def allow_delete_attachment(*names)
        names.each do |k|
          attr_accessor "delete_#{k}".to_sym
          attr_accessible "delete_#{k}".to_sym

          before_validation { send(k).clear if send("delete_#{k}") == '1' }
        end
      end

      def has_attachment(name, options = {})
        name = name.to_sym
        has_one name, -> { where(assetable_field_name: name) }, class_name: "Asset", as: :assetable, dependent: :destroy, autosave: true
        define_method "#{name}_attachment_options".to_sym do
          options
        end

        define_method "#{name}=".to_sym do |val|
          if val.is_a?(File)
            asset = send(name)
            asset = self.association(name).build() if asset.nil?
            asset.assign_attributes(data: val)
          end
        end

        define_method "delete_#{name}" do
          self.send(name).delete
        end

        attr_accessible name
        accepts_nested_attributes_for name
        attr_accessible name, "#{name}_attributes".to_sym
      end



      # def has_html_block(name)
      #   name = name.to_sym
      #   has_one name, -> { where(attachable_field_name: name) }, class_name: "Cms::HtmlBlock", as: :attachable, autosave: true
      #   accepts_nested_attributes_for name
      #   attr_accessible name, "#{name}_attributes".to_sym
      #   # define_method "#{name}" do |locale = I18n.locale|
      #   #   owner = self.association(name).owner
      #   #   owner_class = owner.class
      #   #   HtmlBlock.all.where(attachable_type: owner_class.name, attachable_id: owner.id, attachable_field_name: name).first.try(&:content)
      #   # end
      #
      #
      # end

      def has_html_block(*names, **options)
        names = [:content] if names.empty?
        if self._reflections[:html_blocks].nil?
          has_many :html_blocks, class_name: "Cms::HtmlBlock", as: :attachable
        end
        names.each do |name|
          name = name.to_sym

          if !has_html_block_field_name?(name)
            if self.class_variable_defined?(:@@html_field_names)
              html_field_names = self.class_variable_get(:@@html_field_names)
            end
            html_field_names ||= []

            html_field_names << name.to_s
            class_variable_set(:@@html_field_names, html_field_names)
            define_getter = options[:getter] ||= true
            define_setter = options[:setter] ||= true

            has_one name, -> { where(attachable_field_name: name) }, class_name: "Cms::HtmlBlock", as: :attachable, autosave: true
            accepts_nested_attributes_for name
            attr_accessible name, "#{name}_attributes".to_sym


            if define_getter

              define_method "#{name}" do |locale = I18n.locale|
                owner = self.association(name).owner
                owner_class = owner.class
                HtmlBlock.all.where(attachable_type: owner_class.name, attachable_id: owner.id, attachable_field_name: name).first.try(&:content)
              end
            end

            if define_setter
              define_method "#{name}=" do |value|
                owner = self.association(name).owner
                owner_class = owner.class
                html_block = HtmlBlock.all.where(attachable_type: owner_class.name, attachable_id: owner.id, attachable_field_name: name).first_or_initialize
                html_block.content = value
                html_block.save
              end
            end


          end
        end
      end

      def has_banner

      end

      def html_block_field_names
        return [] if !class_variable_defined?(:@@html_field_names)
        class_variable_get(:@@html_field_names) || []
      end

      def has_html_block_field_name?(name)
        self.class_variable_defined?(:@@html_field_names) && (names = self.class_variable_get(:@@html_field_names)).present? && names.include?(name.to_s)
      end


    end
  end

  def self.create_html_blocks_table
    ActiveRecord::Base.connection.create_table :html_blocks do |t|
      t.text :content

      t.integer :attachable_id
      t.string :attachable_type
      t.string :attachable_field_name
      t.string :key

    end
  end

  def self.drop_html_blocks_table
    ActiveRecord::Base.connection.drop_table :html_blocks
  end

  def self.create_tables
    create_html_blocks_table
  end

  def self.drop_tables
    drop_html_blocks_table
  end
end

ActiveRecord::Base.send(:include, Cms::ActiveRecordExtensions)