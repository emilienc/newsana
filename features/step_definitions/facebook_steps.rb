# encoding: UTF-8

def set_facebook_omniauth (opts = {})
 
OmniAuth.config.test_mode = true

 default = 
 	{
 		:provider => :facebook,
 		:uuid => "1234",
		:facebook => {
						:email => "foobar@example.com",
						:gender => "Male",
						:first_name => "foo",
						:last_name => "bar"

					}

	}

 

credentials = default.merge(opts)

provider = credentials[:provider]

user_hash = credentials[provider]

OmniAuth.config.mock_auth[provider] = Hashie::Mash.new( 
		'uid' => credentials[:uuid],
		'info' => {  "email" => user_hash[:email] } , 
        "extra" => {        
        			"raw_info" => {     "first_name" => user_hash[:first_name],          "last_name" => user_hash[:last_name],          "gender" => user_hash[:gender]          } 
                   }      )

end


When /^I Sign in with Facebook$/ do
  set_facebook_omniauth
  click_link 'Se connecter avec Facebook'
end

Then /^I should see a successful facebook sign up message$/ do
  page.should have_content "Autorisé avec succès par votre compte Facebook."
end

