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

describe 'エラー①：ユーザー新規登録のテスト' do
  let(:user) { build(:user) }

  before do
    visit new_user_registration_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
  end

  context '新規登録成功のテスト' do
    it '外部キー入力を求められることなく正しく新規登録される' do
      expect { click_button "新規登録" }.to change{ User.count }.by(1)
    end
  end

end

describe 'エラー②：新規登録時や簡単ログイン時の画面遷移のテスト' do
  let(:user) { build(:user) }
  let!(:prefecture) { create(:prefecture) } #!がないとindex pageのidとnew pageのURLのidが一致しない？(prefecture.id = within(35..38)とした時) → そんなことはなかった

  before do
    visit '/posts?prefecture_id=' + prefecture.id.to_s
    click_link "新規に投稿する"
  end

  context '「新規に投稿する」を押下後に新規登録した場合' do

    before do
      fill_in 'user[name]', with: user.name
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      fill_in 'user[password_confirmation]', with: user.password_confirmation
      click_button "新規登録"
    end

    it '新規登録後も新規投稿画面に留まる' do
      expect(current_path).to eq '/posts/new?prefecture_id=' + prefecture.id.to_s
      # expect(current_path).to eq "/"
    end
  end

end

