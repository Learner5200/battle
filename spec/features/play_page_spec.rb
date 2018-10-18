feature "play page" do

  before { sign_in_and_play }

  context "initially" do
    scenario "submitted names should appear on screen" do
      expect(page).to have_content("Charmander vs Squirtle")
    end

    scenario "it should display whose turn it is" do
      expect(page).to have_content("Charmander's Turn")
    end

    scenario "player two default hitpoints should appear on screen" do
      expect(page).to have_content("Squirtle: 60hp")
    end
  end

  context "after attacking player two" do
    before do
      allow(Kernel).to receive(:rand).and_return(10)
      click_button "Attack!"
    end
    it "should reduce hitpoints" do
      expect(page).to have_content("Squirtle: 50hp")
    end

    it "should display confirmation" do
      expect(page).to have_content("Charmander attacked Squirtle!")
    end

    it "should change the confirmation based on who attacked" do
      click_button "Switch Player"
      click_button "Attack!"
      expect(page).to have_content("Squirtle attacked Charmander!")
    end

    it "should hide 'Attack! button" do
      expect(page).not_to have_selector(:button, 'Attack!')
    end

    it "should display 'Switch Player' button" do
      expect(page).to have_selector(:button, 'Switch Player')
    end

  end

  context "player 2 hp reduced to 0" do
    scenario "displays player 1 victory message" do
      allow(Kernel).to receive(:rand).and_return(60)
      click_button "Attack!"
      expect(page).to have_content("Charmander wins! Better luck next time, Squirtle!")
    end
  end



end
