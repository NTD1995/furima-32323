require 'rails_helper'

RSpec.describe User, type: :model do
     before do
      @user = FactoryBot.build(:user)
     end
 describe 'ユーザー新規登録' do
   context '新規登録がうまくいくとき' do
     it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
     end
     it 'passwordが6文字以上であれば登録できること' do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user).to be_valid
     end
    end
   context '新規登録がうまくいかないとき' do
     it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end

     it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
     it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it 'first_name_furiganaが空では登録できないこと' do
      @user.first_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank")
     end
     it 'last_name_furiganaが空では登録できないこと' do
      @user.last_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
     end
     it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '11aaa'
      @user.password_confirmation = '11aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end

     it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '11aaaa'
      @user.password_confirmation = '11aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it 'first_nameに数字が含まれている場合では登録できないこと' do
      @user.first_name = '田中3'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
     end
     it 'last_nameに数字が含まれている場合では登録できないこと' do
      @user.last_name = '太郎3'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
     end
     it 'first_name_furiganaに数字が含まれている場合では登録できないこと' do
      @user.first_name_furigana = 'タナカ3'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana 全角文字を使用してください")
     end
     it 'last_name_furiganaに数字が含まれている場合では登録できないこと' do
      @user.last_name_furigana = 'タロウ3'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana 全角文字を使用してください")
     end
     it 'passwordが英字のみの場合では登録できないこと' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'emailには[@]を含まないと登録できないこと' do
      @user.email = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end
     it 'passwordが半角英数字のみの場合では登録できないこと' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'passwordが全角の場合では登録できないこと' do
      @user.password = '@@@@@@'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
   end
  end
end
