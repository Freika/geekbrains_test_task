# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses =
      if params[:filter_by] == 'nearest' || params[:filter_by].nil?
        Course.nearest.includes(groups: :participations).page(params[:page])
      else
        Course.farthest.includes(groups: :participations).page(params[:page])
      end
  end

  def show
    @course = Course.includes(groups: :users).find(params[:id])
  end
end
