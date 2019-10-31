require 'rails_helper'

RSpec.describe Film, type: :model do
    #FactoryBotで映画の情報を@filｍに登録
    before do
        @film = FactoryBot.build(:film)
    end

    describe 'validate of film information' do
        it { is_expected.to validate_presence_of :title } 
        it { is_expected.to validate_length_of(:title).is_at_most(50) } 
        it { is_expected.to validate_presence_of :year } 
        it { is_expected.to (:year) <= 4 } 
        # it {is_expected.to satisfy(:year){|num| num.to_s.size == 4}}
        it { is_expected.to validate_presence_of :director } 
        it { is_expected.to validate_length_of(:director).is_at_most(50) } 
    end

    #it {is_expected.to satisfy(:year){|num| num.to_s.size == 4}}


end