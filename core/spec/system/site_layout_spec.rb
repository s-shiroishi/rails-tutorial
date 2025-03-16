require 'rails_helper'

RSpec.describe "レイアウトの動作確認", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "リンク関連" do
    describe "リンクの数を確認する" do
      it "正しい数のリンクを取得する" do
        visit root_path
        expect(all('a[href="/"]').size).to eq(2)
        expect(all('a[href="/help"]').size).to eq(1)
        expect(all('a[href="/about"]').size).to eq(1)
        expect(all('a[href="/contact"]').size).to eq(1)
        expect(all('a[href="/signup"]').size).to eq(1)
      end
    end
  end
end
