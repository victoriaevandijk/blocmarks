class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.references :user, index: true
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :bookmarks, :users
    add_foreign_key :bookmarks, :topics
  end
end
