
feature 'Testing infrastructure' do

  scenario 'Will use a form to ask for a player name and display on screen' do
    visit('/')
    fill_in :player_name, with: "Jeff"
    click_button "Submit"
    expect(page).to have_content 'Player Name: Jeff'
  end
end
