# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses =
      if params[:filter_by] == 'farthest'
        Course.farthest.includes(groups: :participations).page(params[:page])
      else
        Course.nearest.includes(groups: :participations).page(params[:page])
      end
  end

  def show
    @course = Course.includes(groups: :users).find(params[:id])
  end
end
