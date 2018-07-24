require 'rails_helper'

describe Api::OrdersController do
  describe "POST create" do
    let(:user) { create(:user) }
    let!(:menu) { create(:menu) }
    let(:d_i_first) { create(:first_dish_items) }
    let(:d_i_main) { create(:main_dish_items) }
    let(:d_i_drink) { create(:drink_dish_items) }

    it "create order without auth" do
      post :create

      expect(response.status).to eql(401)
    end

    it "create order" do
      http_login(user.public_key, user.secret_key)

      expect{
        post :create, params: { order: { dish_item_orders_attributes:
          {"0"=>{ dish_item_id: d_i_first.id },
           "1"=>{ dish_item_id: d_i_main.id },
           "2"=>{ dish_item_id: d_i_drink.id }
          }}
        }
        expect(response.status).to eql(200)
        json = JSON.parse(response.body)
        expect(json).to have_key('id')
      }.to change { user.orders.count }.by(1)
    end
  end
end