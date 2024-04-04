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
      it 'passwordは半角英数字でしか登録できない' do
        @user.password = 'password@123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
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
    end
  end
end
