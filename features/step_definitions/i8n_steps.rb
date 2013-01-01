# encoding: UTF-8

When /^I choose french$/ do
 click_link "Français"
end

Then /^I should see a french site$/ do
  page.should have_content 'Accueil'
end

When /^I choose english$/ do
  click_link "English"
end

Then /^I should see an english site$/ do
  page.should have_content 'Home'
end
