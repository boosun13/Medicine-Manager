require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }

  context '値が入力されている場合' do
    it 'ユーザ登録は有効' do
      expect(user).to be_valid
    end
  end
end
