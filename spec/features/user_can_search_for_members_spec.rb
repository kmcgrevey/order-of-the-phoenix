require 'rails_helper'


feature "user can search for Gryffindor members" do

  scenario "user finds detailed list of members" do
    # As a user,
    # When I visit "/"
    visit '/'

    # And I Select “Gryffindor” from the select field
    # (Note: Use the existing select field)
    select "Gryffindor", from: :house
    # And I click "Search For Members“
    click_on "Search For Members"
    # Then I should be on page “/search”
    expect(current_path).to eq(search_path)
    # Then I should see the total number of the order of the phoenix
    #   members that belong to Gryffindor. (i.e. 21)
    expect(page).to have_content("21 members")
      # And I should see a list with the detailed information for the
      #   21 members of the Order of the Phoenix for house Gryffindor.
    expect(page).to have_css(".member", count: 21)

    within(first(".member")) do
      expect(page).to have_css(".name")
      # expect(page).to have_css(".role")
      # expect(page).to have_css(".party")
      # expect(page).to have_css(".district")
    end
  end
end