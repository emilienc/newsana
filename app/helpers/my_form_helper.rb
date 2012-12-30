module MyFormHelper
  def add_dynamic_box(name, form)
    page = %{
      partial = "#{escape_javascript(render(:partial => "private_user", :locals => { :f => form }))}";

      $("#std").append(partial);
    }

    link_to_function name, page
  end
end