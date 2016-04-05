class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :phone
      t.string :email
      t.string :address
      t.string :url
      t.references :user
      t.string :author #facebook id of author


      t.timestamps null: false
    end
  end
end
