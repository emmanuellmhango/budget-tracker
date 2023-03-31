require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Emmanuel', email: 'abc@abc.com') }
  before { subject.save }

  it 'Name should be set' do
    expect(subject.name).to eq('Emmanuel')
  end

  it 'Email should be set' do
    expect(subject.email).to eq('abc@abc.com')
  end
end
