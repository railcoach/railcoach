module UsersHelper
  def translate_gender(code)
    case code
    when 'm'
      gender = 'male'
    when 'f'
      gender = 'female'
    else
      gender = code
    end
    return gender
  end

  def user_edit_and_destroy_links
    a = []
    a.push link_to "Edit", edit_user_profile_path(@user.profile) if can? :edit, @user.profile
    a.push link_to 'Destroy', @user, :confirm => 'Are you sure?', :method => :delete if can? :destroy, @user
    a.join ' - '
  end
end
