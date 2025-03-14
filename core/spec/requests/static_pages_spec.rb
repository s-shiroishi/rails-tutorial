require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GETリクエスト" do
    context '/' do
      it "成功" do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    context "/help" do
      it "成功" do
        get help_path
        expect(response).to have_http_status(:success)
      end
    end

    context "/about" do
      it "成功" do
        get about_path
        expect(response).to have_http_status(:success)
      end
    end
  end

end
