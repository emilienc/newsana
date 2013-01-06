# encoding: UTF-8

When /^I enter a valid exercise$/ do
  #create the activite category first
  CategoryActivite.create(name: "marche")
  click_link "Ajouter une activité"
  select 'marche' , :from => "activite_category_activite_id"
  fill_in "activite_duree", :with => 60
  click_button "Créer"
end

Then /^I should see a successful exercise create message$/ do
  page.should have_content "Votre activité a été enregistrée avec succés."
end

When /^I enter an invalid exercise$/ do
  click_link "Ajouter une activité"
  click_button "Créer"
end

Then /^I should see an error exercise create message$/ do
  page.should have_content "Please review the problems below:"
end

When /^I want to see all my exercises$/ do
  click_link "Voir mes activités"
end

Then /^I should see a table with my exercise$/ do
  page.should have_content "marche"
end

When /^I delete an exercise$/ do
  click_link "marche"
  click_button "Supprimer"
end

Then /^I should see no more exercise$/ do
  page.should have_no_content "marche"
end
