FactoryBot.define do
  factory :order_form do
    postal_code {'123-4567'}
    prefecture_id {2}
    address1{'大阪市'}
    address2{'1丁目'}
    telephone{'12345678912'}
    building { 'マンション' }
    token {"tok_abcdefghijk00000000000000000"}
    user_id {2}
    item_id {2}
  end
end