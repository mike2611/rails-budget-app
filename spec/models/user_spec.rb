require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Testing validations for user' do
    subject { User.new(name: 'John Smith') }
    before { subject.save }
    after { subject.destroy }

    it 'is valid with the inserted valid attributes' do
      expect(subject).to be_valid
    end

    it 'name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
