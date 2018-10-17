def sign_in_and_play
  visit "/"
  fill_in(:player_one, with: "Charmander")
  fill_in(:player_two, with: "Squirtle")
  click_button('submit')
end
