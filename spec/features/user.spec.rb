require 'rails_helper'
RSpec.feature "User management function", type: :feature do
​  background do
    User.create!( name: "meddy",email: 'abayiringira1@.Com',  password: '123456' )
    visit  new_session_path
    fill_in  'Email' ,  with: 'abayiringira1@.Com'
    fill_in  'Password' ,  with: '123456'
    click_on  'Log in'
    visit tasks_path
    click_on 'New Post'
    fill_in  'Name' ,  with: 'grettings'
    fill_in  'Details' ,  with: 'testtesttest'
    click_on '登録する'
    end
    scenario "Test number of users" do
        User.create!(name: 'adax', email: 'adax@gmail.com',  password: '123456',password: '123456')
        @user = User.all.count
        expect(@user).to eq 2
      end
      scenario "Test user list" do
        User.create!(name: 'adax', email: 'adax@gmail.com',  password: '123456',password: '123456')
        visit users_path
        expect(page ).to  have_content  'grettings'
        expect(page ).to  have_content  'testtesttest'
      end
      scenario "Test user creation" do
        User.create!(name: 'adax', email: 'adax@gmail.com',  password: '123456',password: '123456')
        visit users_path
        expect(page ).to  have_content  'grettings'
      end
      scenario "test enable user creation page" do
        visit users_path
        expect(page ).to  have_content  'testtesttest'
      end
​
end