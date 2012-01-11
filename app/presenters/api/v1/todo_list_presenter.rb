class Api::V1::TodoListPresenter < Api::V1::BasePresenter
  def present_object(object, options = {})
    return object unless object.errors.empty? # Renders validation errors
    unless options[:include_root]
      if options[:minimal]
        {
          :id => object.id,
          :name => object.name
        }
      elsif options[:awesome]
        {
          :id => object.id,
          :name => object.name,
          :awesome => true,
          :message => object.hello
        }
      else
        object.as_json
      end
    else
      options.merge!(:include_root => false)
      { subject_class.to_sym => present_object(object, options) }
    end
  end
end
