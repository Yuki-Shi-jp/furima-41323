FactoryBot.define do
  factory :user do
    nickname { 'TestUser' }
    email { 'test@example.com' }
    last_name { '山田' } # 全角文字
    first_name { '太郎' } # 全角文字
    kana_last_name { 'ヤマダ' } # 全角カタカナ
    kana_first_name { 'タロウ' } # 全角カタカナ
    birthday { '2000-01-01' }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
