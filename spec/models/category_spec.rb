require 'rails_helper'

RSpec.describe Category, type: :model do
  user = User.create(name: 'Emmanuel', email: 'abc@abc.com')
  subject do
    Category.new(
      name: 'Hotels',
      icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png',
      user_id: user.id
    )
  end
  before { subject.save }

  it 'Category name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon to be string' do
    expect(subject.icon).to be_a(String)
  end

  it 'Category name to be Hotels' do
    expect(subject.name).to eql('Hotels')
  end
end
