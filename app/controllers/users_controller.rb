class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Account created successfully."
    else
      flash[:error] = "An error occurred!"
      render :new
    end
  end

  def show
    if @user == current_user
      render :show
    else
      redirect_to root_path, notice: "You are not signed in."
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(
    :name,
    :password,
    :happiness,
    :nausea,
    :height,
    :tickets,
    :admin
    )
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
