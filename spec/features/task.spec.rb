# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
    background do
        Task.create!(name: 'adax', details: 'time')
        Task.create!(name: 'adali', details: 'igihe')
      end
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  scenario "Test task list" do
  visit tasks_path
  # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method
  expect(page).to have_content 'time'
  expect(page).to have_content 'igihe'
  end
  scenario "Test task creation" do
  visit new_task_path 
  fill_in 'Name', with: 'janvier'
  fill_in 'Details', with: 'monday'
 click_button '登録する'
 visit tasks_path
 expect(page).to have_content 'janvier'
 expect(page).to have_content 'monday'
  end
  scenario "Test task details" do
  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
  end
end