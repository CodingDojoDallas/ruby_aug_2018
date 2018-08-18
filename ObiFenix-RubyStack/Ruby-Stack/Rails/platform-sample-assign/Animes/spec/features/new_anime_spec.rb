require 'rails_helper'

RSpec.describe 'create new anime' do
  it 'displays correct fields (form) to create new anime' do

    visit '/animes/new'

    expect(page).to have_text('Title')
  end
end
