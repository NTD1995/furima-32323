class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :phone_number, :house_number, :building_number, :city, :user_id, :item_id, :shipping_area_id, :purchase_id, :token

  validates :postal_code,  presence: true
  validates :phone_number, presence: true
  validates :house_number,  presence: true
  validates :city,  presence: true
  validates :shipping_area_id,  numericality: { other_than: 1 } 
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :phone_number, length: { maximum: 11 }
  validates :phone_number, format: { with: /\A\d{11}\z/, message: "is not invalid. Include hyphen(-)" }
  validates :token, presence: true

  def save 
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, city: city, phone_number: phone_number, house_number: house_number, building_number: building_number, purchase_id: purchase.id, shipping_area_id: shipping_area_id)
  end
end