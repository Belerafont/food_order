FactoryBot.define do
  factory :order do
    user

    after(:build) do |order|
      dif = create(:first_dish_items)
      dim = create(:main_dish_items)
      did = create(:drink_dish_items)
      order.dish_items << [dif, dim, did]
    end
  end
end