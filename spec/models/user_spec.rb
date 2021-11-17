require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end

  it "Userが有効であるか" do
    expect(@user).to be_valid
  end

  it "名前のバリデーションが機能しているか" do
  end

  it "ポリシーのバリデーションが機能しているか" do
  end
end
