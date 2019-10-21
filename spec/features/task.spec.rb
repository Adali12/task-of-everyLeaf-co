require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
background do
  User.create!( name: "meddy",email: 'abayiringira1@.Com',  password: '123456',password: '123456' )
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
  scenario "Test task list" do
  expect(page).to have_content 'testtesttest'
  visit tasks_path
  end
  scenario "Test task creation" do
  visit new_task_path
  fill_in 'Name', with: 'task'
  fill_in 'Details', with: 'successfully created'
  click_on  '登録する'
  expect(page).to have_content('task')
  expect(page).to have_content('successfully created')
  end
  scenario "Test task details" do
   task1=Task.first
   visit task_path(id: task1.id)
   expect(page).to have_content('testtesttest')
  end
  scenario "Test task updating" do
   task1=Task.first
   visit edit_task_path(id: task1.id)
   fill_in 'Name', with: 'suredeal'
   fill_in 'Detail', with: 'of course'
   click_on '更新する'
   visit tasks_path
   expect(page).to have_content('suredeal')
   expect(page).to have_content('of course')
  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.all.order(' created_at desc')
    visit tasks_path
    expect(page).to have_content 'test'
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
         expect(page).to have_content 'test'
       end
       scenario "Test search by status" do

         visit tasks_path
         fill_in 'Search by Status', with: 'In progress'
         expect(page).to have_content 'grettings'
       end
       scenario "Test search by both title and status" do
        visit tasks_path
        fill_in 'Search by Status', with: 'In progress'
        expect(page).to have_content 'grettings'
         
       end
       
end
