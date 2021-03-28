class InquiresController < ApplicationController

  def index
    @inquires = Inquiry.all.order("created_at DESC")
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params_inquiry)
    if @inquiry.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @inquiry = Inquiry.find_by(params[:id])
    if @inquiry.destroy
      redirect_to inquires_path
    end
  end

  private

  def params_inquiry
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
