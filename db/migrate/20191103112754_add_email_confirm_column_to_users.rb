class AddEmailConfirmColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :zusers, :email_confirmed, :boolean, :default => false
    add_column :zusers, :confirm_token, :string
  end
end
