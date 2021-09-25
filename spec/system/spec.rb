require 'rails_helper'

describe 'ユーザーログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
    end
  end
end

describe 'ユーザー新規登録のテスト' do
  let(:user) { create(:user) }
  
  before do
    visit new_user_registration_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
  end
  
  context '新規登録成功のテスト' do
    it '正しく新規登録される' do
    end
  end
  
end