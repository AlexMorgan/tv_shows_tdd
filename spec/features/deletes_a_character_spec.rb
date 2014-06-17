require 'rails_helper'

feature 'user deletes a character',%Q{
  As a site visitor
  I want to delete a character so I can stop watching him
} do

  scenario 'user deletes a character' do
    show = TelevisionShow.create!(title: 'Game of Thrones', network: 'HBO')
    character = Character.create!(name: "Jaymie Lanister",
      actor: "Some kid",
      description: "Some pain in the ass!",
      television_show_id: show.id)
    character1 = Character.create!(name: "Tyrion Lanister",
      actor: "Some Guy",
      description: "Some pain in the ass!",
      television_show_id: show.id)

    visit character_path(character)

    click_on 'Delete'

    expect(page).to have_content 'Character has been deleted'
    expect(page).to_not have_content character.name
  end

end
