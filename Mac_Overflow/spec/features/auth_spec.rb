# require 'rails_helper'

# feature 'User Management' do
#   scenario 'New user sign up' do
#     visit root_path
#     page.find("#signup").click
#     fill_in 'user[name]', with: 'Jane Doe'
#     fill_in 'user[password]', with: '123'
#     fill_in 'user[password_confirmation]', with: '123'
#     click_button 'Submit'
#     expect(page).to have_content "Welcome Jane Doe!"
#   end
# end