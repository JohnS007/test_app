class AddSecurePasswordToZuser < ActiveRecord::Migration[5.2]
  def change
    add_column :zusers, :password_digest, :string
  end
end
