require 'spec_helper'

describe User do
  it "is valid with an email" do
    user = User.new(
      email: 'lau@gmail.com'
    )
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new
    expect(user).to be_invalid
  end

  it "is valid with a salt" do
    user = User.new
    expect(user).to be_valid
  end

  it "is invalid without a salt" do
    user = User.new
    expect(user).to be_invalid
  end

  it "is valid with a fish" do
    user = User.new
    expect(user).to be_valid
  end

  it "is invalid without a fish" do
    user = User.new
    expect(user).to be_invalid
  end
end

