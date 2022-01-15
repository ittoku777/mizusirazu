module ApplicationHelper
  # returns full title for each page
  def full_title(page_title = '')
    base_title = 'Mizusirazu'

    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  private
    def set_form_field_name(field_name)
      case(field_name)
      # user
      when :name then 'text' + '_field'
      when :email then 'email' + '_field'
      when :password then 'password' + '_field'
      when :password_confirmation then 'password' + '_field'
      # profile
      when :bio then 'text' + '_area'
      when :location then 'text' + '_field'
      end
    end
end
