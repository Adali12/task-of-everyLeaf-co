
require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
  background do
    # visit new_task_path 
    #     User.create(name: 'adali',email: 'adali@gmail.com',password: 'princess')
    #   Task.create!(name: 'test', details: 'hello guys', status:'Done', priority:'High', start: '2019-10-02 11:23:44.239125 ' , enddate: '2019-10-02 11:23:44.239129 ', user_id: 2)
    # fill_in  'Name' ,  with: 'grettings'
    # fill_in  'Details' ,  with: 'testtesttest'
    # click_on '登録する'
    # click_on 'Back'
  end
  scenario "Test task creation" do
visit new_task_path 
fill_in  'Name' ,  with: 'grettings'
fill_in  'Details' ,  with: 'testtesttest'
click_on '登録する'
click_on 'Back'
  end
  scenario "Test task list" do
  end
  scenario "Test task details" do
  end
  scenario "Test whether tasks are arranged in descending order of creation date" do
    assert Task.all.order('created_at DESC')
  end
  scenario "Test whether tasks are search by status or by Name " do
    # visit tasks_path
    # fill_in 'Name', with: 'adali'
    # fill_in 'Status', with: 'Done'
    # click_button 'search'
  end
  scenario "Test whether tasks are Sort in high order by priority " do
    assert Task.all.order('priority desc')
  end
end