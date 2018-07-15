require 'rails_helper'

describe Menu, type: :model do
  context 'factory' do
    it 'valid' do
      expect(create(:menu)).to be_valid
    end

    it { should have_many(:dish_item_menus) }
    it { should have_many(:dish_items) }
  end
end