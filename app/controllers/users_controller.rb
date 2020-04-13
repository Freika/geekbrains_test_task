# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_user,    only: :edit
  before_action :authenticate_user, only: :show
  before_action :set_user,          only: %i[show destroy]

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def authorize_user
    redirect_to root_path, notice: 'You can\'t do that' unless current_user.id == params[:user_id]
  end

  def authenticate_user
    redirect_to root_path, notice: 'You must be logged in' unless current_user
  end
end
