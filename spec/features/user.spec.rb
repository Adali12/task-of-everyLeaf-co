# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature " user management function ", type: :feature do
# In scenario (alias of it), write the processing of the test for each item you want to check.
background do
 User.create!(name: "armel", email: 'arl@gmail.Com', password: '1234567')
 visit  new_session_path
#  fill_in  'email' ,  with: 'arl@gmail.Com'
#  fill_in  'password' ,  with: '1234567'
 click_on  'Log in'
end
scenario "Test number of users" do
 User.create!(name: 'Nina', email: 'nina@gmail.com', password: '1234567')
 @user = User.all.count
 expect(@user).to eq 2
end
      scenario "Test user list" do
        User.create!(name: 'adax', email: 'adax@gmail.com',  password: '123456')
        visit users_path
  
      end
      scenario "Test user creation" do
        User.create!(name: 'adax', email: 'adax@gmail.com',  password: '123456')
        visit users_path
      end
      scenario "test enable user creation page" do
        visit users_path
      end
end