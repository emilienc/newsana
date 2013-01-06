# encoding: UTF-8

Then /^I should have a link to create my profile$/ do
  page.should have_content "Voir mon profil"
end

When /^I create a valid profile$/ do
  click_link "Voir mon profil"
  fill_in "taille en cm", :with => 175
  click_button "Modifier"
end

Then /^I should see a profile created message$/ do
  page.should have_content 'Votre profil a bien été créé.'
end

Then /^I should have a link to edit my profile$/ do
  page.should have_content "Voir mon profil"
end

When /^I update my profile$/ do
  click_link "Voir mon profil"
  fill_in "taille en cm", :with => 110
  click_button "Modifier"
end

Then /^I should see a profile updated message$/ do
  page.should have_content 'Votre profil a bien été modifié.'
end
