require 'rails_helper'

describe User do
  it "is valid with username, password" do
    user = User.new(
      username: "Allen",
      password: "password" )
    expect(user).to be_valid
  end
  
  it "is invalid without a username" do
    expect(User.new(username: nil)).to_not be_valid
  end

  it "is invalid without a password" do
    expect(User.new(password: nil)).to_not be_valid
  end
end