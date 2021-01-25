class CoachesController < ApplicationController
  def index
    @coaches = Coach.order(:name)
  end
end
