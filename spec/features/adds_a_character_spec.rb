require 'rails_helper'

feature 'user can add a character to the database', %Q{
  As a site visitor I would like to be able
  to add my favorite characters to the database
} do

  # Acceptance Criteria:
  # * The site provides a form that I can fill out
  # * and add a character to the database

  scenario 'user creates a valid character' do
    show = TelevisionShow.create!(title: 'Californication', network: 'Shotime')
    visit "/television_shows/#{show.id}"

    # Fill in the input field with the 'Name' label
    fill_in "Name", with: "Hank Moody"
    fill_in "Actor", with: "Some boss"
    fill_in "Description", with: "This guy is the man!"
    click_on 'Create Character'

    expect(page).to have_content 'Success, character added'
    expect(page).to have_content 'Hank Moody'
    expect(page).to have_content 'Some boss'
  end

  scenario 'user does not fill in required attributes' do
    show = TelevisionShow.create!(title: 'Californication', network: 'Shotime')
    visit television_show_path(show)
    # visit "/television_shows/#{show.id}"
    click_on 'Create Character'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "can't be blank"
  end

  scenario 'user cannot create duplicated characters' do
    show = TelevisionShow.create!(title: 'Californication', network: 'Shotime')
    Character.create!(name: "Hank Moody", actor: "Some boss", television_show_id: show.id)
    visit "/television_shows/#{show.id}"
    fill_in 'Name', with:"Hank Moody"
    fill_in 'Actor', with: "Some boss"
    click_on 'Create Character'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "has already been taken"
  end
end
