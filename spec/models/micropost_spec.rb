# Micropostモデルのテスト

require 'rails_helper'

RSpec.describe Micropost, type: :model do

    # バリデーションのテスト
    describe 'validations' do
        it { is_expected.to validate_presence_of(:user_id) }
        it { is_expected.to validate_presence_of(:content) }
    end
end
