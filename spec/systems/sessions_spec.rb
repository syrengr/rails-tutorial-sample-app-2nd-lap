# ログインのテスト（ログイン成功）
# Sessionsのフラッシュメッセージのテスト（ログイン失敗）

require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  before do
    visit login_path
  end

  describe 'enter an valid values' do
    let!(:user) { create(:user, email: 'loginuser@example.com', password: 'password') }
    before do
      fill_in 'Email', with: 'loginuser@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end
    subject { page }
    # ログインしたときのページのレイアウトの確認
    # it 'log in' do
    #   is_expected.to have_current_path user_path(user) #現在のページのurlについて検証
    #   is_expected.to_not have_link nil, href: login_path
    #   click_link 'Account' #ドロップダウンリンクをクリック
    #   is_expected.to have_link 'Profile', href: user_path(user)
    #   is_expected.to have_link 'Log out', href: logout_path
    # end
    # 追記したログアウトのテスト
    # it 'log out after log in' do
    #   click_link 'Account'
    #   click_link 'Log out'
    #   is_expected.to have_current_path root_path
    #   is_expected.to have_link 'Log in', href: login_path
    #   is_expected.to_not have_link 'Account'
    #   is_expected.to_not have_link nil, href: logout_path
    #   is_expected.to_not have_link nil, href: user_path(user)
    # end
  end

  #無効な値を入力する
  describe 'enter an invalid values' do
    before do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
    end
    subject { page }
    #フラッシュメッセージが出る
    it 'gets an flash messages' do
      is_expected.to have_selector('.alert-danger', text: 'Invalid email/password combination')
      is_expected.to have_current_path login_path
    end
    #違うページにアクセスしたとき
    context 'access to other page' do
      before { visit root_path }
      #フラッシュメッセージが消える
      it 'is flash disappear' do
        is_expected.to_not have_selector('.alert-danger', text: 'Invalid email/password combination')
      end
    end
  end
end
