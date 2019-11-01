# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Label Management function", type: :feature do
# In scenario (alias of it), write the processing of the test for each item you want to check.
background do
  User.create!(name: "armel", email: 'arl@gmail.Com', admin: 'true',  password: '1234567')
  visit  root_path
  click_on  'Log in'
end
scenario "Can create label" do
   @user=User.first
   @label = Label.create!(title: "TestLabel",user_id: @user.id)
   visit labels_path
   expect(page).to have_content('TestLabel')
 end
scenario "can search by attached labels " do
   visit new_label_path
   click_on '登録する'
   @user=User.first
   @task = Task.create!(name: "Test", details: 'test2',status: 'In progress',user_id: @user.id)
   @label1 = Label.first
    @label2 = Label.last
    # @task.labels = [@label1,@label2]
   @task.save
   visit tasks_path
   fill_in  'key' ,  with: 'label1'
   click_on 'Search'
   expect(page).to have_content('')
 end
end