require 'rails_helper'

RSpec.describe User, type: :model do
  describe "属性検証" do
    let(:user){User.new(name: "example", email: "user@example.com", password: "password", password_confirmation: "password")}

    describe "name" do
      describe "存在検証" do
        it "nameが空の場合は無効であること" do
          user.name = ''
          expect(user.valid?).to be(false)
          expect(user.errors.full_messages).to include("Name can't be blank")
        end
      end

      describe "文字数検証" do
        it "nameが51文字以上の場合は無効であること" do
          user.name = 'a' * 51
          expect(user.valid?).to be(false)
          expect(user.errors.full_messages).to include("Name is too long (maximum is 50 characters)")
        end
      end
    end

    describe "email" do
      describe "存在検証" do
        it "emailが空の場合は無効であること" do
          user.email = ''
          expect(user.valid?).to be(false)
          expect(user.errors.full_messages).to include("Email can't be blank")
        end
      end

      describe "文字数検証" do
        it "emailが256文字以上の場合は無効であること" do
          user.email = "a" * 244 + "@example.com"
          expect(user.valid?).to be(false)
          expect(user.errors.full_messages).to include("Email is too long (maximum is 255 characters)")
        end
      end

      describe "フォーマット検証" do
        context "メールアドレスが正しい形式の場合" do
          it "ユーザーは有効であること" do
            valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
            valid_addresses.each do |valid_address|
              user.email = valid_address
              expect(user.valid?).to be(true), "#{valid_address} は有効であるべき"
            end
          end
        end
        context "メールアドレスが不正な形式の場合" do
          it "ユーザーは無効であること" do
            invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
            invalid_addresses.each do |invalid_address|
              user.email = invalid_address
              expect(user.valid?).to be(false), "#{invalid_address} は無効である"
              expect(user.errors.full_messages).to include("Email is invalid")
            end
          end
        end
      end

      describe "一意性検証" do
        it "重複したメールアドレスは無効であること" do
          dup_user = user.dup
          user.save
          expect(dup_user.valid?).to be(false)
        end
      end
    end

    describe "password" do
      describe "空白検証" do
        it "空の場合は無効である" do
          user.password = " " * 6
          expect(user.valid?).to be(false)
        end
      end

      describe "文字数検証" do
        it "5文字以下の場合は無効である" do
          user.password = "a" * 5
          expect(user.valid?).to be(false)
        end
      end
    end
  end
end
