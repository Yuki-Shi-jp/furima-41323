require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'メールアドレスが必須であること' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'メールアドレスが一意であること' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email, password: 'password1', password_confirmation: 'password1',
                                           nickname: 'anotheruser', last_name: '山田', first_name: '次郎', kana_last_name: 'ヤマダ', kana_first_name: 'ジロウ', birthday: '1991-01-01')
    another_user.valid?
    puts another_user.errors.full_messages # ここでエラーメッセージを出力
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end

  it 'メールアドレスには@が含まれること' do
    @user.email = 'test.com'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end

  it 'パスワードが必須であること' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'パスワードは6文字以上が必要であること' do
    @user.password = '12345'
    @user.password_confirmation = '12345'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

  it 'パスワードとパスワード（確認）が一致する必要があること' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
end
