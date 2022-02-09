require 'rails_helper'

RSpec.describe 'Categories index', type: :system do
  describe 'Check the content of categories index' do
    before(:each) do
      user = User.create(name: 'mike', email: 'mike@gmail.com', password: 'mike123')
      group = Group.create(name: 'Fast food', icon: 'exampleIcon',
                           user_id: user.id)
      group2 = Group.create(name: 'Clothes',
                            icon: 'exampleIcon', user: user.id)
      cost = Cost.create(name: 'Hamburguer', amount: 50, user_id: user.id)
      cost2 = Cost.create(name: 'Fries', amount: 25, user_id: user.id)
      cost3 = Cost.create(name: 'Hoodie', amount: 500, user_id: user.id)
      CostGroup.create(cost_id: cost.id, group: group)
      CostGroup.create(cost_id: cost2.id, group: group)
      CostGroup.create(cost_id: cost3.id, group: group2)
      visit root_path
      sleep(2)
      fill_in 'user_email', with: 'mike@gmail.com'
      fill_in 'user_password', with: 'mike123'
      click_button 'Log in'
      sleep(2)
    end
    it 'it shows the name for both categories' do
      expect(page).to have_content('Fast food')
      expect(page).to have_content('Clothes')
    end
    it 'it shows the correct total for both categories' do
      expect(page).to have_content('75')
      expect(page).to have_content('500')
    end
    it 'it shows the Add Category btn' do
      expect(page).to have_content('Add Category')
    end
  end
end
