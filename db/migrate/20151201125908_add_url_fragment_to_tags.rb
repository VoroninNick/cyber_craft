class AddUrlFragmentToTags < ActiveRecord::Migration
  def change
    add_column :tags, :url_fragment, :string
  end
end
