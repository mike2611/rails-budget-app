require 'rails_helper'

RSpec.describe 'Categories index', type: :system do
  describe 'Check the content of categories index' do
    before(:each) do
      user = User.create(name: 'mike', email: 'mike@gmail.com', password: 'mike123')
      group = Group.create(name: 'Fast food', icon: 'exampleIcon',
                           user_id: user.id)
      group2 = Group.create(name: 'Clothes',
                            icon: 'exampleIcon', user_id: user.id)
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
      click_link 'Add Category'
      sleep(2)
    end
    it 'it shows the correct inputs' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Icon')
    end
    it 'it shows the correct category after adding it' do
      fill_in 'group_name', with: 'Video Games'
      fill_in 'group_icon',
              with: 'https://cdn-icons-png.flaticon.com/512/732/732060.png'
      click_button 'Add Category'
      sleep(2)
      expect(page).to have_content('Video Games')
    end
  end
end
