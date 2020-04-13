# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  http_basic_authenticate_with name: 'admin', password: 'admin', if: :admin_controller?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def admin_controller?
    self.class < ActiveAdmin::BaseController
  end
end
