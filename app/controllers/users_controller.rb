class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: "Отлично, Вы зарегистрировались!"
    else
      render 'new'

    end
  end

  def edit

  end

  def show
    @user = User.find params[:id]
    @questions = @user.questions.order(created_at: :desc)

    @new_question = @user.questions.build

    @questions_count = @questions.count
    @answers_count = @questions.where.not(answer: nil).count
    @unanswered_count = @questions_count - @answers_count
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url)
  end
end
