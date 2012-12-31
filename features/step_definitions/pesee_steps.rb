# encoding: UTF-8

When /^I enter a pesee with valid pesee data$/ do
  click_link "Add Pesee"
  fill_in "pesee_what", :with => 90
  click_button "Create Pesee"
end

Then /^I should see a successful pesee create message$/ do
  page.should have_content "Pesee was successfully created."
end

When /^I go to see all my pesees$/ do
  click_link "Voir mes pesées"
end

Then /^I should see a table with my pesee$/ do
  page.should have_content "Liste des pesees"
end