require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '新規登録に必要な情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aa000'
        @user.password_confirmation = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'lastnameに半角カタカナが含むと登録できない' do
        @user.lastname = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end
      it 'firstnameに半角カタカナが含むと登録できない' do
        @user.firstname = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end
      it 'lastname_furiganaが空では登録できない' do
        @user.lastname_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname furigana can't be blank")
      end
      it 'firstname_furiganaが空では登録できない' do
        @user.firstname_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname furigana can't be blank")
      end
      it 'lastname_furiganaに全角ひらがなが含むと登録できない' do
        @user.lastname_furigana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname furigana is invalid')
      end
      it 'firstname_furiganaに全角ひらがなが含むと登録できない' do
        @user.firstname_furigana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname furigana is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '０aaa111'
        @user.password_confirmation = '０aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    end
  end
end
