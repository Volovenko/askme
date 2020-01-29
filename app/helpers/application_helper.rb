module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.png'
    end
  end

  def inclination(number, vopros, voprosa, voprosov)
    sklonenie = number % 10
    big_sklonenie = number % 100

    if number == 0 || !number.is_a?(Numeric)
      voprosov
    elsif big_sklonenie.between?(11, 14)
      voprosov
    elsif sklonenie == 1
      vopros
    elsif sklonenie.between?(2, 4)
      voprosa
    else
      voprosov
    end
  end
end
