FactoryBot.define do
  factory :menu do

    after(:build) do |menu|
      dif = create(:first_dish_items)
      dim = create(:main_dish_items)
      did = create(:drink_dish_items)
    menu.dish_items << [dif, dim, did]
    end
  end
end
