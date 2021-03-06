class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :phone_number, :house_number, :building_number, :city, :user_id, :item_id, :shipping_area_id, :token
  with_options presence: true do
  validates :postal_code  
  validates :phone_number
  validates :house_number
  validates :city
  validates :token
  validates :user_id
  validates :item_id
  end
  validates :shipping_area_id,  numericality: { other_than: 1 } 
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :phone_number, format: { with: /\A\d{11}\z/, message: "is not invalid. Include hyphen(-)" }
  validates :phone_number, length: { maximum: 11 }
  def save 
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, city: city, phone_number: phone_number, house_number: house_number, building_number: building_number, purchase_id: purchase.id, shipping_area_id: shipping_area_id)
  end
end