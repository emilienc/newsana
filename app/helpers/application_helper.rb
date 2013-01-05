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


	
end
