FactoryBot.define do
  factory :item do
    name{"a"}        
    description{"a"}  
    items_status_id{2}    
    category_id{2}       
    shipping_charges_id{2}
    shipping_area_id   {2}
    price {300}             
    days_to_ship_id {2}        
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
