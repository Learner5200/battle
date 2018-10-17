feature "names form" do
  scenario "submitted names should appear on screen" do
    visit "/"
    fill_in(:player_one, with: "Imtiyaz")
    fill_in(:player_two, with: "Chris")
    click_button('submit')
    expect(page).to have_content("Imtiyaz vs Chris")
  end
end
