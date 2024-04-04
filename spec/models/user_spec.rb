require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できるとき' do
      it '規定通り入力できている' do
        expect(@user).to be_valid
      end
    end

    describe 'ユーザー新規登録' do
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'password123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordは半角英数字でしか登録できない' do
        @user.password = 'password@123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1234'
        @user.password_confirmation = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = 'a' * 129
        @user.password_confirmation = 'a' * 129
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)"
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'nicknameは12文字までしか登録できない' do
        @user.nickname = '1234567890123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname is too long (maximum is 12 characters)"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'invalid_email.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it '重複したemailが存在する場合は登録できない' do
        existing_user = FactoryBot.create(:user, email: 'test@example.com')
        @user.email = 'test@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email has already been taken"
      end
    end
  end
end
