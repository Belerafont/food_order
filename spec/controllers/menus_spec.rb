require 'rails_helper'

describe MenusController do
  describe "GET index" do
    let(:user) { create(:user) }

    it "assigns @menus" do
      sign_in(user)
      menu = create(:menu)

      get :index

      expect(response.status).to eql(200)
      expect(assigns(:menus)).to eq([menu])
    end

    it "renders the index template" do
      sign_in(user)

      get :index

      expect(response.status).to eql(200)
      expect(response).to render_template("index")
    end
  end
end