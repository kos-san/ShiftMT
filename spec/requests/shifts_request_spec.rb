require 'rails_helper'

RSpec.describe "Shifts", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/shifts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/shifts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/shifts/show"
      expect(response).to have_http_status(:success)
    end
  end

end
