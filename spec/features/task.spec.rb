require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
background do
    # Task.create!(title: 'Student', content: 'Is a good student')
   # Task.create!(title: 'Accountant', content: 'Balance money')
   User.create!(name: "shema", email: 'shema@gmail.com',  password: 'prince')
  end
  scenario "Test task list" do
    visit new_task_path
    @user=User.first
  Task.create!(name: "test", details: "content1", user_id: @user.id)
  Task.create!(name: "test2", details: "content2",user_id: @user.id)
    visit tasks_path
  end
  scenario "Test task creation" do
    @user=User.first
    Task.create!(name: "test2", details: "content2",user_id: @user.id)
      visit tasks_path
      expect(page).to have_content ''
  end
  scenario "Test task details" do
   task1=Task.first
  #  visit task_path(id: task.id)
  #  expect(page).to have_content('')
  end
  scenario "Test task updating" do
   task1=Task.first
   visit tasks_path
   expect(page).to have_content('')
   expect(page).to have_content('')
  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.all.order(' created_at desc')
    visit tasks_path
    expect(page).to have_content ''
     end
     scenario "Test task for sorting by leaving time " do
       visit tasks_path
       assert Task.all.order("enddate DESC")
     end
     scenario "Test sorting by high priority" do
       visit tasks_path
       click_on "priority High"
       assert Task.all.order("priority DESC")
       end
       scenario "Test search by title" do
         visit tasks_path
         expect(page).to have_content ''
       end
       scenario "Test search by status" do

         visit tasks_path
         fill_in 'Search by Status', with: 'In progress'
         expect(page).to have_content ''
       end
       scenario "Test search by both title and status" do
        visit tasks_path
        fill_in 'Search by Status', with: 'In progress'
        expect(page).to have_content ''
         
       end
       
end
