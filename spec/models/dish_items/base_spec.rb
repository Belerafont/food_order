require 'rails_helper'

describe DishItems::Base, type: :model do
  context 'factory' do
    it 'valid' do
      expect(create(:base_dish_items)).to be_valid
    end

    it { should have_many(:dish_item_menus) }
    it { should have_many(:menus) }
    it { should have_many(:dish_item_orders) }
    it { should have_many(:orders) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end
end
