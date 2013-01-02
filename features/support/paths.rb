module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the new aliment page/
      new_aliment_path

      when /edit page for that aliment/
        raise 'no aliment' unless @aliment
        edit_aliment_path(@aliment)
      when /page for that aliment/
        raise 'no aliment' unless @aliment
        aliment_path(@aliment)
      when /edit page for the (\d+)(?:st|nd|rd|th) aliment/
        raise 'no aliments' unless @aliments
        nth_aliment = @aliments[$1.to_i - 1]
        edit_aliment_path(nth_aliment)
      when /page for the (\d+)(?:st|nd|rd|th) aliment/
        raise 'no aliments' unless @aliments
        nth_aliment = @aliments[$1.to_i - 1]
        aliment_path(nth_aliment)


    when /the sign up page/
      '/users/sign_up'

    when /the sign in page/
      '/users/sign_in'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
