# StaticPagesコントローラのテスト

require 'rails_helper'

# ログインのテスト（ログイン成功）
RSpec.describe 'access to sessions', type: :request do
    let!(:user) { create(:user) }
    describe 'POST #create' do
        # it 'log in and redirect to detail page' do
        #     post login_path, params: { session: { email: user.email,
        #                                         password: user.password } }
        #     expect(response).to redirect_to user_path(user)
        #     expect(is_logged_in?).to be_truthy #ログインしているかのテストここでis_logged_in?を使ってます。
        # end
    end
end

# コントローラのテスト
RSpec.describe 'Access to static_pages', type: :request do
    context 'GET #home' do
        before { get root_path }   
        it 'responds successfully' do
            expect(response).to have_http_status 200
        end
    end
  
    context 'GET #help' do
        before { get help_path } 
        it 'responds successfully' do
            expect(response).to have_http_status 200
        end
        # it "has title 'Home | Ruby on Rails Tutorial Sample App'" do
        #     expect(response.body).to include full_title('Help')
        # end
    end
  
    context 'GET #about' do
        before { get about_path }
        it 'responds successfully' do
            expect(response).to have_http_status 200
        end
        # it "has title 'Home | Ruby on Rails Tutorial Sample App'" do
        #     expect(response.body).to include full_title('About')
        # end
    end
end
