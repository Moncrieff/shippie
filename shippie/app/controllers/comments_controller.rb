class CommentsController < ApplicationController
  before_filter :find_delivery

  def new
    @comment = @delivery.comments.build
  end

  def create
    @comment = @delivery.comments.build(params[:comment].try(:merge!, :user => current_user))
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to @delivery
    else
      flash[:alert] = "Comment has not been created."
      redirect_to @delivery
    end
  end

  private

  def find_delivery
    @delivery = Delivery.find(params[:delivery_id])
  end
end
