When /^I enter a pesee with valid pesee data$/ do
  click_link "Add Pesee"
  fill_in "pesee_what", :with => 90
  click_button "Create Pesee"
end

Then /^I should see a successful pesee create message$/ do
  page.should have_content "Pesee was successfully created."
end