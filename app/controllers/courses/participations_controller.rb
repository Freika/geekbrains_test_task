# frozen_string_literal: true

class Courses::ParticipationsController < ApplicationController
  before_action :set_course

  def create
    result = ParticipationContainer[:create].call(@course, params[:group_id], current_user.id)

    redirect_to @course, notice: result
  end

  def destroy
    result = ParticipationContainer[:destroy].call(@course, params[:group_id], current_user.id)

    redirect_to @course, notice: result
  end

  private

  def set_course
    @course = Course.includes(:groups).find(params[:course_id])
  end
end
