RSpec.describe 'creating anime' do
  it 'create an anime and redirect to new page' do
    visit '/animes/new'
    fill_in 'Title', with: 'Naruto' # Fields to fill
    click_button 'Create Anime'

    expect(current_path).to eq('/animes')
    expect(page).to have_text('Naruto')
  end
end
