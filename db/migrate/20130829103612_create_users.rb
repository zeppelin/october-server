class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.text    :name
      t.string  :nickname
      t.text    :email
      t.text    :image_url
      t.text    :github_url

      t.timestamps
    end
  end
end
