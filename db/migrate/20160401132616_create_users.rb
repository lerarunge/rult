class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :facebook_id
      t.string :login
      t.string :photo
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :groups

      t.timestamps null: false
    end
  end
end
