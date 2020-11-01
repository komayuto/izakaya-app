class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  enum gender: { male: 0, female: 1, other: 2 }

  def age
    return '不明' unless birtday.prosent?
    years = Time.zone.now.year - birtday.year
    days = Time.zone.now.yday - birtday.yday
    if days < 0
      "#{years - 1}歳"
    else
      "#{years}歳"
    end
  end
end