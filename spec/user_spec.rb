require 'rails_helper'

RSpec.describe User do
  it "is invalid without username" do
    sc = User.new(username: "", real_name: "aaaa")
    expect(sc).not_to be_valid
    expect(sc.username).to eq(true)
  end
end