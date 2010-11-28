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
end
