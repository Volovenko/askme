module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.png'
    end
  end

def inclination(number, vopros, voprosa, voprosov)
    if (number == nil || !number.is_a?(Numeric))
      number = 0
    end

    if (11..14).include?(number % 100)
      return voprosov
    end
    # Склоняем в зависимости от остатка деления на 10
    ostatok = number % 10
    if ostatok == 1
      return vopros
    end

    if (2..4).include?(ostatok)
      return voprosa
    end
    
    if ostatok > 4 || ostatok == 0
      return voprosov
    end
  end
end
