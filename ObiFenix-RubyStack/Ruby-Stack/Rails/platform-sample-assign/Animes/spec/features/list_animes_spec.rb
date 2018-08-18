require 'rails_helper'

RSpec.describe 'listing animes' do
  it 'displays list of all animes' do
    anime_1 = Anime.create(title: 'Naruto')
    anime_2 = Anime.create(title: 'Dragon Ball Z')

    visit '/animes'

    expect(page).to have_text(anime_1.title)
    expect(page).to have_text(anime_2.title)
  end
end
