require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
          expect(@user).to be_valid
        end  
        it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
          @user.password = 'a1huhuhu'
          @user.password_confirmation = 'a1huhuhu'
          expect(@user).to be_valid
        end
      
      end

      context '新規登録できないとき' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailに@が含まれていない場合、登録できないこと' do
          @user.email = 'testtest'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Email is invalid'
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordが英数字でないと登録できない' do
          @user.password = '漢字'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password is invalid'
        end
        it 'passwordが半角英数混合でないと登録できない' do
          @user.password = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password is invalid'
        end
        it 'passeordが数字のみでは登録できない' do
          @user.password = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password is invalid'
        end


      end
    end      






















end
