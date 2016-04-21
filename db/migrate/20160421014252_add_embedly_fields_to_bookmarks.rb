class AddEmbedlyFieldsToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :provider_url, :string
    add_column :bookmarks, :description, :string
    add_column :bookmarks, :title, :string
    add_column :bookmarks, :thumbnail_width, :integer
    add_column :bookmarks, :thumbnail_url, :string
    add_column :bookmarks, :thumbnail_height, :integer
  end
end
