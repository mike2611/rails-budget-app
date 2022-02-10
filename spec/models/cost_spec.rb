require 'rails_helper'

RSpec.describe Cost, type: :model do
  context 'Testing validations for cost' do
    before(:all) do
      @user = User.create(name: 'John Smith', email: 'john@mail.com', password: 'pass123')
    end
    subject { Cost.new(name: 'CostTest', amount: 2, user: @user) }
    before { subject.save }
    after(:all) do
      @user.destroy
    end

    it 'is valid with the inserted valid attributes' do
      expect(subject).to be_valid
    end

    it 'name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'user_id must not be blank' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'amount should >= 1' do
      subject.amount = -1
      expect(subject).to_not be_valid
    end
  end
end
