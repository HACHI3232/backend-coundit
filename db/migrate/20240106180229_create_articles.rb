class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :body
      t.text :slug
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
