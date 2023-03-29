require 'rails_helper'

RSpec.describe Purchase, type: :model do
  user = User.create(name: 'Emmanuel', email: 'abc@abc.com')
  subject do
    Purchase.new(
      name: 'Accomodation',
      amount: 10.2,
      user_id: user.id
    )
  end
  before { subject.save }

  it 'Purchase name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount to be 10.2' do
    expect(subject.amount).to eql(10.2)
  end

  it 'Purchase name to be Accomodation' do
    expect(subject.name).to eql('Accomodation')
  end
end
