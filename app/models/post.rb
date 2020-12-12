class Post < ApplicationRecord
  has_one_attached :eyecatch
  validates :content, presence: true, length: { maximum: 200 }
  belongs_to :user
  has_rich_text :content

  has_many :comments, dependent: :destroy

  def self.search(search)
    if search
      Post.where(['content LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end

  def author_name
    user.display_name
  end
