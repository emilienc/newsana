# encoding: UTF-8

def delete_repas
  @all = Repa.all
  @all.each do |repa|
  	repa.destroy
  end 
end

def create_bad_repa
  delete_repas
  @repas = FactoryGirl.create(:repa_without_name)
end


def create_repa
  delete_repas
  @repas = FactoryGirl.create(:repa_with_ingredients)
end

When /^I create a valid repas$/ do
  create_repa
end

When /^I create a bad repas$/ do
  create_bad_repa
end

Then /^I should see a successful repas create message$/ do
  click_link "Voir mes repas"
  page.should have_content "dejeuner"
end

Then /^I should not see a successful repas create message$/ do
  click_link "Voir mes repas"
  page.should have_no_content "dejeuner"
end