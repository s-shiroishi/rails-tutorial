require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "成功" do
      get "/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /help" do
    it "成功" do
      get "/help"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "成功" do
      get "/about"
      expect(response).to have_http_status(:success)
    end
  end

end
