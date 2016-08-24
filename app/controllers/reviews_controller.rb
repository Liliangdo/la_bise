class ReviewsController < ApplicationController
  before_action :find_review, only: [:create]

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.event = @event
    if @review.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  private
  #def find_review
  #  @review = Review.find(params[:id])
  #end
  def review_params
    params.require(:reviews).permit(:content, :rating)
  end
end
