require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GETリクエスト" do
    describe "レスポンスコード200が返ってくる" do
      it "正常" do
        get signup_path
        expect(response).to have_http_status(:success)
      end
    end
  end

end
