require 'rails_helper'

RSpec.describe Topic, type: :model do
  it 'is valid with title, body and node' do
    expect(create(:topic)).to be_valid
  end
end
