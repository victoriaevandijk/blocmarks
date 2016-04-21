class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  before_save :generate_embedly
  
  def generate_embedly
    data = Embed.getdata(self.url)
    self.thumbnail_url = data[:thumbnail_url]
    self.title = data[:title]
  end
end
