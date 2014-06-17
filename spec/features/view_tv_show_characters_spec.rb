require 'rails_helper'

feature 'user sees a list of all television show characters' do
  scenario 'user adds a new TV show' do
    attrs = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

    show = TelevisionShow.create!(attrs)

    character1 = Character.create!(name: "Prince Joffrey", actor: "Some Kid",
      description: "This kid is an asshole", television_show_id: show.id)
    character2 = Character.create!(name: "Jamie Lanister", actor: "Some Guy",
      description: "This guy is an asshole", television_show_id: show.id)
    character3 = Character.create!(name: "Hank Moody", actor: "Some Boss",
      description: "This guy is the man", television_show_id: 2)

    visit "/television_shows/#{show.id}"

    expect(page).to have_content character1.name
    expect(page).to have_content character2.name
    expect(page).to_not have_content character3.name

  end
end
