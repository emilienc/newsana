# encoding: UTF-8

Then /^I should have a link to create my profile$/ do
  page.should have_content "Créer mon profil"
end

When /^I create a valid profile$/ do
  click_link "Créer mon profil"
  fill_in "Taille", :with => 100
  click_button "Create Profile"
end

Then /^I should see a profile created message$/ do
  page.should have_content "Profile was successfully created."
end

Then /^I should have a link to edit my profile$/ do
  page.should have_content "Editer mon profil"
end

When /^I update my profile$/ do
  click_link "Editer mon profil"
  fill_in "Taille", :with => 110
  click_button "Update Profile"
end

Then /^I should see a profile updated message$/ do
  page.should have_content "Profile was successfully updated."
end
