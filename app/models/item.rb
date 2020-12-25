class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :days_ship
  belongs_to :category

  with_options presence: true do
    :item_name
    :price
    :description
  end

  validate :image_presence

  def image_presence
    unless image.attached?
      errors.add(:image, 'ファイルを選択してください')
    end
  end

  has_one_attached :image
  belongs_to :user

  

end
