
feature 'Testing infrastructure' do

  scenario 'Will use a form to ask for a player name and display on screen' do
    sign_in_and_play
    expect(page).to have_content "Player 1 Name: Jeff!" and have_content "Player 2 Name: Jim!" and have_content "Let's battle!!!"
  end

  scenario 'See Player 2 Hit Points' do
    sign_in_and_play
  expect(page).to have_content "Jim Hit Points "
  end



end
