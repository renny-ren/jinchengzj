require 'rails_helper'

describe User do
  it 'is valid with username, password' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid without a username' do
    expect(User.new(username: nil)).to_not be_valid
  end

  it 'is invalid without a password' do
    expect(User.new(password: nil)).to_not be_valid
  end

  it 'is invalid with a duplicate username' do
    create(:user, username: 'allen')
    user = build(:user, username: 'allen')
    expect(user).to_not be_valid
  end
end
