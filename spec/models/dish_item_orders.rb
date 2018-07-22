require 'rails_helper'

describe DishItemOrder, type: :model do
  context 'factory' do
    it 'valid' do
      expect(create(:dish_item_orders)).to be_valid
    end

    it { should belong_to(:order) }
    it { should belong_to(:dish_item) }
  end
end