# encoding: UTF-8

When /^I enter a pesee with valid pesee data$/ do
  click_link "Ajouter une pesée"
  fill_in "pesee_what", :with => 90
  click_button "Créer"
end

Then /^I should see a successful pesee create message$/ do
  page.should have_content "Votre nouveau poids a été enregistré avec succés."
end

When /^I want to see all my pesees$/ do
  click_link "Voir mes pesées"
end

Then /^I should see a table with my pesee$/ do
  page.should have_content "Pesées de "+ @user.name
  page.should have_content @user.pesees.first.what
end

When /^I see the dashboard$/ do
  click_link 'Dietbook'
end

Then /^I should see I have no pesee$/ do
 page.should have_content "Vous n'avez pas encore de pesée"
end