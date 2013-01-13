# encoding: UTF-8
module ApplicationHelper

def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def icon_link_to(path, opts = {}, link_opts = {})
    classes = []
    [:icon, :blank].each do |klass|
      if k = opts.delete(klass)
        classes << "#{klass}-#{k}"
      end
    end
    classes << "enlarge" if opts.delete(:enlarge)
    opts[:class] ||= ""
    opts[:class] << " " << classes.join(" ")
    link_to content_tag(:i, "", opts), path, link_opts
  end

  def errors_for(object, message=nil)
    html = ""
    unless object.errors.blank?
      html << "<div class='alert alert-error alert-block'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5>La création n'a pas été possible</h5>\n"
        else
          html << "\t\t<h5>La modification a échouée</h5>\n"
        end    
      else
        html << "<h5>#{message}</h5>"
      end  
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html
  end  


	
end
