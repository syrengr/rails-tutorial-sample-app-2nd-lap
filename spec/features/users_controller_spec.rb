require 'rails_helper'

describe 'signup' do
  specify '画面の表示' do
    visit '/static_pages/home'
    expect(page).to have_title('h1', text: 'Sample App')
  end
end
