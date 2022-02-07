require 'rails_helper'

RSpec.describe CostGroup, type: :model do
  context 'Testing validations for cost_groups' do
    before(:all) do
      @user = User.create(name: 'John Smith', email: 'john@mail.com', password: 'pass123')
      @cost = Cost.create(name: 'CostTest', amount: 2, user:  @user )
      @group = Group.create(name: 'GroupTest', icon: 'http://icon.url', user:  @user )
    end
    subject { CostGroup.new(cost: @cost, group: @group )}
    before { subject.save }
    after(:all) do
      @cost.destroy
      @group.destroy
      @user.destroy
    end

    it 'is valid with the inserted valid attributes' do
      expect(subject).to be_valid
    end
  end
end
