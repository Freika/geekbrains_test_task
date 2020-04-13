# frozen_string_literal: true

class Courses::ParticipationsController < ApplicationController
  before_action :set_course

  def create
    result = ::ParticipationContainer[:create].call(params[:course_id], params[:group_id], current_user.id)

    redirect_to @course, notice: result
  end

  def destroy
    result = ::ParticipationContainer[:destroy].call(params[:course_id], params[:group_id], current_user.id)

    redirect_to @course, notice: result
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end
end
