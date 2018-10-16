feature "Testing infrastructure working!" do
  scenario "should have 'Testing infrastructure working!'" do
    visit '/'
    expect(page).to have_content "Testing infrastructure working!"
  end

end
