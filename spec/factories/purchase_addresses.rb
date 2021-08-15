FactoryBot.define do
  factory :purchase_address do
    postal_code {'123-4567'}
    phone_number{'09012345678'}
    house_number{'青山1-1-1'}
    building_number{'柳ビル103'}
    city{'横浜市緑区'}
    shipping_area_id{ 2 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
