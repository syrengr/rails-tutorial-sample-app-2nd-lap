=begin
static_pagesコントローラのテスト
=end

require 'rails_helper'

RSpec.describe 'Access to static_pages', type: :request do
    context 'GET #home' do
        before { get root_path }   
        it 'responds successfully' do
            expect(response).to have_http_status 200
        end
        it "has title 'Ruby on Rails Tutorial Sample App'" do
            expect(response.body).to include full_title('') #変更部分
            expect(response.body).to_not include '| Ruby on Rails Tutorial Sample App'
        end
    end
  
    context 'GET #help' do
        before { get help_path } 
        it 'responds successfully' do
            expect(response).to have_http_status 200
        end
        it "has title 'Home | Ruby on Rails Tutorial Sample App'" do
            expect(response.body).to include full_title('Help') #変更部分
        end
    end
  
    context 'GET #about' do
        before { get about_path }
        it 'responds successfully' do
            expect(response).to have_http_status 200
        end
        it "has title 'Home | Ruby on Rails Tutorial Sample App'" do
            expect(response.body).to include full_title('About') #変更部分
        end
    end
end
