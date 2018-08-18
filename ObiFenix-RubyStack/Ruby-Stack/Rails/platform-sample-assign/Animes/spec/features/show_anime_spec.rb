require 'rails_helper'

RSpec.describe "showing single anime's details page..." do
  it "shall display information about a single anime" do
    single_anime = Anime.create(title: "Naruto")

    visit "/animes/#{single_anime.id}"
    expect(page).to have_text(single_anime.title)
  end
end
