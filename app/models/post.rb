class Post < ApplicationRecord
  has_one_attached :eyecatch
  validates :content, presence: true, length: { maximum: 200 }
  belongs_to :user

  def self.search(search)
    Post.all unless search
    Post.where(['content LIKE ?', "%#{search}%#"])
  end

  

end
