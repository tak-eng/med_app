require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'アイデア新規登録' do
    it 'bodyが空では登録できない' do
      idea = Idea.new(body: '')
      idea.valid?
      expect(idea.errors.full_messages).to include("Body can't be blank")
    end
  end
end
