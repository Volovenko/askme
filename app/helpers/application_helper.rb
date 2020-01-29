module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.png'
    end
  end

  def inclination_questions(number, vopros, voprosa, voprosov)
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

  def inclination_answers(number, otvet, otveta, otvetov)
    sklonenie = number % 10
    big_sklonenie = number % 100

    if number == 0 || !number.is_a?(Numeric)
      otvetov
    elsif big_sklonenie.between?(11, 14)
      otvetov
    elsif sklonenie == 1
      otvet
    elsif sklonenie.between?(2, 4)
      otveta
    else
      otvetov
    end
  end
end
