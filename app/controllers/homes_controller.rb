class HomesController < ApplicationController
  def index
    @spaces = Space.order(created_at: :desc).all
  end
end
