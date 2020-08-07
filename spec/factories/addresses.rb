FactoryBot.define do
  factory :address do
    postal_code         { "180-1234" }
    shipping_origin_id  { 2 }
    city                { "赤木区"}
    house_number        { "開示町1-1" }
    building_name       { "エスポワール101" }
    tel                 { "09011111111" }
  end
end
