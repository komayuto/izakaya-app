class Timeline < ApplicationRecord
  has_one_attached :eyecatch
  has_rich_text :content
  validates :title, presence: true
  validates :title, length: { minimum: 2, maxmim: 50 }
  validates :content, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :user
end
