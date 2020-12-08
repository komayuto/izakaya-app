class Timeline < ApplicationRecord
  has_one_attached :eyecatch
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 50 }
  validates :content, presence: true
  belongs_to :user
end
