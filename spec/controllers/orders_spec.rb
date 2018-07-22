require 'rails_helper'

describe OrdersController do
  let(:user) { create(:user) }
  let(:menu) { create(:menu) }
  describe "GET new" do
    it "assigns @menu" do
      sign_in(user)
      order = build(:order)

      get :new, { format: menu.date }

      expect(response.status).to eql(200)
      expect(assigns(:menu)).to eq(menu)
      expect(response).to render_template("new")
    end
  end

  describe 'POST create' do
    let(:d_i_first) { create(:first_dish_items) }
    let(:d_i_main) { create(:main_dish_items) }
    let(:d_i_drink) { create(:drink_dish_items) }

    it 'create @order' do
      sign_in(user)

      expect{
        post :create,  params: { order: { dish_item_orders_attributes:
          {"0"=>{ dish_item_id: d_i_first.id },
           "1"=>{ dish_item_id: d_i_main.id },
           "2"=>{ dish_item_id: d_i_drink.id }
          }}
        }

        expect(response.status).to eql(302)
        expect(response).to redirect_to(menus_path)
      }.to change { user.orders.count }.by(1)
    end

    it 'should failed params render template new' do
      sign_in(user)

      expect{
        post :create,  params: { order: { dish_item_orders_attributes:
          {"0"=>{ dish_item_id: 'wrong_id' },
           "1"=>{ dish_item_id: d_i_main.id },
           "2"=>{ dish_item_id: d_i_drink.id }
          }}
        }

        expect(response.status).to eql(200)
        expect(response).to render_template("new")
      }.to change { user.orders.count }.by(0)
    end
  end
end