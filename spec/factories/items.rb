FactoryBot.define do
  factory :item do
    name{'ボール'}
    description{'野球ボール'}
    category_id{2}
    condition_id{2}
    delivery_charge_id{2}
    prefecture_id{2}
    delivery_day_id{2}
    price{2000}
    association :user   
  end
end
