# encoding: UTF-8
### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
    :password => "please", :password_confirmation => "please" }
end

def find_admin
  @visitor = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email] )
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_name", :with => @visitor[:name]
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Inscription"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Connexion"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "please123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Gerer mon compte"
  fill_in "user_name", :with => "newname"
  fill_in "user_current_password", :with => @visitor[:password]
  click_button "Modifier"
end

When /^I look at the list of users$/ do
  visit '/users'
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Deconnexion"
  page.should_not have_content "Inscription"
  page.should_not have_content "Connexion"
end

Then /^I should be signed out$/ do
  page.should have_content "Connexion"
  page.should_not have_content "Deconnexion"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Connecté avec succès."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Bienvenue ! Vous vous êtes enregistré avec succès"
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Emailn'est pas valide"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Mot de passedoit être rempli(e)"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Mot de passene concorde pas avec la confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Mot de passene concorde pas avec la confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Déconnecté avec succès."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Email ou mot de passe incorrect."
end

Then /^I should see an account edited message$/ do
  page.should have_content "Votre compte a été modifié avec succès."
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end

Then /^I should see my IMC$/ do
  create_user
  page.should have_content Doctor.imc(@user)
end
