
require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
    background do
        Task.create!(name: 'adax', details: 'time')
        Task.create!(name: 'adali', details: 'igihe')
      end
  scenario "Test task list" do
  visit tasks_path
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
  scenario "Test whether tasks are search by status or by Name " do
  end
end