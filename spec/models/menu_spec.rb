require 'rails_helper'

describe Menu, type: :model do
  context 'factory' do
    it 'valid' do
      expect(create(:menu)).to be_valid
    end

    it { should have_many(:dish_item_menus) }
    it { should have_many(:dish_items) }

    it 'should menu have dete' do
      menu = create(:menu)
      expect(menu.date).to_not eql(nil)
    end
  end
end