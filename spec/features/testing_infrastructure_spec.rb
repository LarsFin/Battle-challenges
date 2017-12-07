
feature 'Testing infrastructure' do

  scenario 'Will use a form to ask for a player name and display on screen' do
    visit('/')
    fill_in :player_1_name, with: "Jeff"
    fill_in :player_2_name, with: "Jim"
    click_button "Submit"
    expect(page).to have_content "Player 1 Name: Jeff!" and have_content "Player 2 Name: Jim!" and have_content "Let's battle!!!"
  end

  scenario 'see Player 2 Hit Points' do
  visit('/')
  fill_in :player_1_name, with: "Jeff"
  fill_in :player_2_name, with: "Jim"
  click_button "Submit"
  expect(page).to have_content "Jim Hit Points "
  end

end
