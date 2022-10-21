FactoryBot.define do
  factory :item do
    association :user

    item_name{Faker::Name.name}
    item_description{Faker::Lorem.sentence}
    item_category_id {Faker::Number.between(from: 1, to: 10)}
    item_status_id {Faker::Number.between(from: 1, to: 6 )}
    delivery_charge_id {Faker::Number.between(from: 1, to: 2)}
    prefecture_id{Faker::Number.between(from: 1, to: 47 )}
    delivery_days_id{Faker::Number.between(from: 1, to: 3 )}
    price {Faker::Number.between(from: 300, to: 9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
