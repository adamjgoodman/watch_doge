class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :category
      t.text :content
      t.integer :user_id
      t.timestamps
    end
    add_index :articles, :user_id
  end
end
