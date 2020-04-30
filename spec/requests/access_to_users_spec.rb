# Usersコントローラーのテスト

require 'rails_helper'

RSpec.describe 'access to users', type: :request do 
    describe 'GET #new' do
        # it 'responds successfully' do
        # get signup_path
        # expect(response).to have_http_status 200
        # end
    end

    # User Specテスト（有効なリクエストと無効なリクエスト）
    # ユーザー作成時にログインしているかのテスト
    describe 'POST #create' do
        context 'valid request' do
            it 'adds a user' do
                # expect do
                #     post signup_path, params: { user: attributes_for(:user) }
                # end.to change(User, :count).by(1)
            end

            context 'adds a user' do
                before { post signup_path, params: { user: attributes_for(:user) } }
                subject { response }
                # it { is_expected.to redirect_to user_path(User.last) }
                # it { is_expected.to have_http_status 302 }
                # it 'log in' do
                #     expect(is_logged_in?).to be_truthy
                # end
            end
        end

        # 無効なリクエスト
        context 'invalid request' do
            # 無効なデータを作成
            let(:user_params) do
                attributes_for(:user, name: '',
                                    email: 'user@invalid',
                                    password: '',
                                    password_confirmation: '')
            end
            # ユーザーが追加されない
            # it 'does not add a user' do
            #     expect do
            #         post signup_path, params: { user: user_params }
            #     end.to change(User, :count).by(0)
            # end
        end
    end
end
