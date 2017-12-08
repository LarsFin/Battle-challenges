def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: "Jeff"
  fill_in :player_2_name, with: "Jim"
  click_button "Submit"
end

def attack_and_continue
  click_button "Attack"
  click_button("Ok")
end
