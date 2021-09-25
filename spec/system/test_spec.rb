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
  let(:user) { build(:user) }

  before do
    visit new_user_registration_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
  end

  context '新規登録成功のテスト' do
    it '正しく新規登録される' do
      binding.pry
      expect { click_button "新規登録" }.to change{ User.count }.by(1)
      # # expect(page).to have_button "新規登録"
      # click_button "新規登録"
      # expect(current_path).to eq '/'
    end
  end

end

describe '新規投稿時の画面遷移のテスト' do
  let(:user) { create(:user) }
  let!(:prefecture) { create(:prefecture) } #!がないとindex pageのidとnew pageのURLのidが一致しない？

  before do
    visit posts_path(prefecture_id: prefecture.id)
    click_button "新規に投稿する"
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_button "新規登録"
  end

  it '新規登録後に新規投稿画面に遷移する' do
    expect(current_path).to eq '/posts/' + 'new?prefecture_id=' + prefecture.id.to_s
  end

end

