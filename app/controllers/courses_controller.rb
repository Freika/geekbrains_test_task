# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses = Course.page(params[:page])
  end

  def show; end
end
