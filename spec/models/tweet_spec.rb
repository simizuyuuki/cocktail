require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @user = FactoryBot.create(:user) 
    @tweet = FactoryBot.build(:tweet, user: @user)
  end

  describe 'ツイートの保存' do
    context 'ツイートが投稿できる場合' do
      it '規定通り入力すれば投稿できる' do
        tweet = FactoryBot.build(:tweet, text: 'This is a test tweet.', user: @user)
        expect(tweet).to be_valid
      end
    end
      context 'ツイートが投稿できない場合' do
        it 'タイトルが空では投稿できない' do
          tweet = FactoryBot.build(:tweet, name: '', user: @user)
          tweet.valid?
          expect(tweet.errors.full_messages).to include "Name can't be blank"
        end  
        it '画像がない場合は投稿できない' do
          @tweet.image = nil
          @tweet.valid?
          expect(@tweet.errors.full_messages).to include("Image can't be blank")
        end
        it 'テキストが空では投稿できない' do
          tweet = FactoryBot.build(:tweet, text: '', user: @user)
          tweet.valid?
          expect(tweet.errors.full_messages).to include "Text can't be blank"
        end
        it 'テキストは168文字しか入力できない' do
          tweet = FactoryBot.build(:tweet, text: 'a' * 169)
          tweet.valid?
          expect(tweet.errors.full_messages).to include "Text is too long (maximum is 168 characters)"
        end
        it 'ユーザーが紐付いていなければ投稿できない' do
          tweet = FactoryBot.build(:tweet, user: nil)
          tweet.valid?
          expect(tweet.errors.full_messages).to include "User must exist"
        end
      end
    end
  end