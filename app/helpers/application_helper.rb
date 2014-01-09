module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def fb_image_tag user
    image_tag href="http://graph.facebook.com/#{user.uid}/picture?width=25&redirect=1&type=square&height=25", class: "media-object img-rounded pull-left"
  end
end
