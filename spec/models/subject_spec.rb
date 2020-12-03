require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe '#create' do
    before do
      @subject = FactoryBot.build(:subject)
    end

    it '全ての記載ができれば登録する' do
      expect(@subject).to be_valid
    end

  end
end
