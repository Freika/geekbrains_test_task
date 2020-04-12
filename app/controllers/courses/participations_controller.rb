# frozen_string_literal: true

class Courses::ParticipationsController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    group = course.groups.find(params[:id])

    success = group.users << current_user

    if success
      redirect_to course, notice: 'You have successfully joined to this course!'
    else
      redirect_to course, notice: 'It seems like you already on this course! Try another group!'
    end
  end

  def destroy
    @course = Course.includes(:groups).find(params[:id])
  end
end
