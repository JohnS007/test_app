class AddZuserToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :zuser_id, :integer
  end
end
