class AddAdminToZusers < ActiveRecord::Migration[5.2]
  def change
    add_column :zusers, :admin, :boolean, default: false
  end
end
