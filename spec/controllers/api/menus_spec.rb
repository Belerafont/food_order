require 'rails_helper'

describe Api::MenusController do
  describe "GET index" do
    let(:user) { create(:user) }
    let!(:menu) { create(:menu) }

    it "renders the index template without auth" do
      get :index

      expect(response.status).to eql(401)
    end

    it "renders the index template" do
      http_login(user.public_key, user.secret_key)

      get :index

      expect(response.status).to eql(200)
      json = JSON.parse(response.body)
      expect(json.count).to eql(1)
      menu_json = json.first
      expect(menu_json).to have_key('id')
      expect(menu_json).to have_key('date')
    end
  end
end