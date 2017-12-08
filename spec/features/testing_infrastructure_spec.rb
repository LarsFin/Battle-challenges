
feature 'Testing infrastructure' do

  scenario 'Will use a form to ask for a player name and display on screen' do
    sign_in_and_play
    expect(page).to have_content "Player 1 Name: Jeff!" and have_content "Player 2 Name: Jim!" and have_content "Let's battle!!!"
  end

  scenario 'See Player 1 & Player 2 Hit Points' do
    sign_in_and_play
    expect(page).to have_content "Jim's HP" and have_content "Jeff's HP"
  end

  scenario 'Display current players turn' do
    sign_in_and_play
    expect(page).to have_content "Jeff's turn"
  end

  scenario 'Should switch turn when hitting ok after attack' do
    sign_in_and_play
    attack_and_continue
    expect(page).to_not have_content "Jeff's turn"
    expect(page).to have_content "Jim's turn"
  end

  scenario 'should display the loser' do
    sign_in_and_play
    18.times{attack_and_continue}
    click_button "Attack"
    expect(page).to have_content "Jim dead"
  end
end
