require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe  "GETリクエスト" do
    describe "レスポンスコード200が返ってくる" do
      context "/" do
        it "正常" do
          get root_path
          expect(response).to have_http_status(:success)
        end
      end

      context "/about" do
        it "正常" do
          get about_path
          expect(response).to have_http_status(:success)
        end
      end

      context "/help" do
        it "正常" do
          get help_path
          expect(response).to have_http_status(:success)
        end
      end

      context "/contact" do
        it "正常" do
          get contact_path
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end
