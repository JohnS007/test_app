class CreateZusers < ActiveRecord::Migration[5.2]
  def change
    create_table :zusers do |t|
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
