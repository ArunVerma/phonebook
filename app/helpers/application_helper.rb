module ApplicationHelper
  # method to handle error messages
  def error_messages_for(object)
    render(partial: 'application/error_messages',
           locals: { object: object }) unless object.blank? || object.errors.count.zero?
  end

  # method to handle form error highlight
  def form_class(object, column)
    if object.errors[column].empty?
      ''
    else
      'has-error'
    end
  end

  # method to handle form error autofocus
  def form_autofocus(object, column)
    if object.errors[column].empty?
      false
    else
      true
    end
  end

  # method to add link, to add row for creating new reocrd (address or phone numbers)
  def link_to_add_new_row(name, f, association, el_class)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do | builder |
      render(association.to_s.singularize, f: builder)
    end
    link_to(name, '#', class: el_class, data: {id: id, fields: fields.gsub("\n", "")})
  end
end
