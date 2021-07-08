class Item < ApplicationRecord
 belongs_to :user
 has_one :purchase
 has_one_attached :image
 belongs_to :shipping_area
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :days_to_ship
 belongs_to :items_status
 belongs_to :shipping_area
 belongs_to :shipping_charges

 validates :name, :description, :image, presence: true

 validates :category_id, :days_to_ship_id, :items_status_id, :shipping_area_id, :shipping_charges_id, numericality: { other_than: 1 } 

 validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end