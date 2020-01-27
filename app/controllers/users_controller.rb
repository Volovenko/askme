class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'sporter',
        avatar_url: 'https://volovenko.github.io/cv/images/avatar.png'
      ),

      User.new(
        id: 2,
        name: 'Leha',
        username: 'seoshik'
      )
    ]
  end

  def new

  end

  def edit

  end

  def show
    @user = User.new(
      name: 'Vadim',
      username: 'sporter',
      avatar_url: 'https://volovenko.github.io/cv/images/avatar.png'
    )

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.01.2020')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('27.01.2020'))
    ]

    @new_question = Question.new
  end
end
