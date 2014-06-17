require 'rails_helper'

feature 'user views list of all characters', %Q{
  As a site visitor
  I want to view a list of people's favorite characters
} do

  # Acceptance Criteria:
  # * I can see a list of all characters and the tv show they belong to

  scenario 'user views characters' do
    show = TelevisionShow.create!(title: 'Game of Thrones', network: 'HBO')

    characters = []
    character_attrs = [
      { name: "Prince Joffrey", actor: "Some Kid",
        description: "This kid is an asshole", television_show_id: show.id },
      { name: "Jamie Lanister", actor: "Some Guy",
        description: "This guy is an asshole", television_show_id: show.id }
    ]

    character_attrs.each do |attrs|
      characters << Character.create(attrs)
    end

    visit '/characters'
    characters.each do |c|
      expect(page).to have_content c.name
      expect(page).to have_content c.television_show.title
    end
  end
end
