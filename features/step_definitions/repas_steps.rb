# encoding: UTF-8

When /^I enter a repas with valid repas data$/ do
  click_link "Ajouter un repas"
  page.select('dejeuner', :from => 'repa_name')
  #fill_in "repa_type", :with => "dejeuner"
  click_button "Create Repa"
end

Then /^I should see a successful repas create message$/ do
  page.should have_content "Repa was successfully created."
end

When /^I go to see all my repas$/ do
  click_link "Voir mes repas"
end

Then /^I should see a table with my repas$/ do
  page.should have_content "Liste des repas"
end