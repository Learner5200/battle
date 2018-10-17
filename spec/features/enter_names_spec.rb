feature "play page" do

  before { sign_in_and_play }
  scenario "submitted names should appear on screen" do
    expect(page).to have_content("Charmander vs Squirtle")
  end

  scenario "player two default hitpoints should appear on screen" do
    expect(page).to have_content("Squirtle: 60hp")
  end

  context "when attacking player two" do
    it "should reduce hitpoints" do
      click_button "Attack!"
      expect(page).to have_content("Squirtle: 50hp")
    end

    it "should display confirmation" do
      click_button "Attack!"
      expect(page).to have_content("Charmander attacked Squirtle!")
    end
  end
end
