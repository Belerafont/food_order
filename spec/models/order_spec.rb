require 'rails_helper'

describe Order, type: :model do
  context 'factory' do
    it 'valid' do
      expect(create(:order)).to be_valid
    end

    it { should have_many(:dish_item_orders) }
    it { should have_many(:dish_items) }
    it { should accept_nested_attributes_for(:dish_item_orders) }
  end
end
