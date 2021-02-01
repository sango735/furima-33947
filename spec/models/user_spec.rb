require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在していれば登録出来る' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上あり、英数字を含めていれば登録できる' do
        @user.password = '123aaa'
        @user.password_confirmation = '123aaa'
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
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠マークが含まれない場合は登録できない' do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.messages).to include(email: ['is invalid'])
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致の場合登録出来ない' do
        @user.password = '123aaa'
        @user.password_confirmation = '1234aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.messages).to include(first_name: ['is invalid'])
      end
      it 'last_nameが半角だと登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.messages).to include(last_name: ['is invalid'])
      end
      it 'first_name_kanaが半角だと登録できない' do
        @user.first_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.messages).to include(first_name_kana: ['is invalid'])
      end
      it 'lasst_name_kanaが半角だと登録できない' do
        @user.last_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.messages).to include(last_name_kana: ['is invalid'])
      end
      it 'first_name_kanaが漢字だと登録できない' do
        @user.first_name_kana = '試験'
        @user.valid?
        expect(@user.errors.messages).to include(first_name_kana: ['is invalid'])
      end
      it 'last_name_kanaが漢字だと登録できない' do
        @user.last_name_kana = '試験'
        @user.valid?
        expect(@user.errors.messages).to include(last_name_kana: ['is invalid'])
      end
      it 'first_name_kanaがひらがなだと登録できない' do
        @user.first_name_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.messages).to include(first_name_kana: ['is invalid'])
      end
      it 'last_name_kanaがひらがなだと登録できない' do
        @user.last_name_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.messages).to include(last_name_kana: ['is invalid'])
      end

    end
  end
end
