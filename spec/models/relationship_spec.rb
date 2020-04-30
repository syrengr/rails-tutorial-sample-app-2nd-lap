# Relationshipモデルのテスト

require 'rails_helper'

RSpec.describe Relationship, type: :model do

    describe 'validations' do
        it { is_expected.to validate_presence_of(:follower_id) }
        it { is_expected.to validate_presence_of(:followed_id) }
    end
end
