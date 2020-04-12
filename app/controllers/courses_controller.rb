# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses = Course.includes(:groups).page(params[:page])
  end

  def show
    @course = Course.includes(:groups).find(params[:id])
  end
end
