FactoryBot.define do

  factory :product do
    name                { "ぬいぐるみ" }
    explanation         { "もふもふです" }
    status_id           { 2 }
    delivery_fee_id     { 2 }
    shipping_origin_id  { 2 }
    until_shipping_id   { 2 }
    price               { "1000" }
    category_id         { 2 }
    image               { fixture_file_upload("#{Rails.root}/public/images/test_image.jpg")}
  end
end