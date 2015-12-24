class CreateFormConfigs < ActiveRecord::Migration
  def up
    Cms.create_form_configs_table
  end

  def down
    Cms.drop_form_configs_table
  end
end
