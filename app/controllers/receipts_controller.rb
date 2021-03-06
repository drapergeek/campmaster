class ReceiptsController < ApplicationController

  def index
    @receipts = Receipt.order("created_at DESC").page(params[:page])
  end

  def new
    @receipt = Receipt.new
  end

  def create
    receipt = Receipt.new(receipt_params)
    if receipt.save
      flash[:notice] = "Created receipt for #{receipt.name}"
      redirect_to new_receipt_path
    else
      flash[:error] = 'Please check for errors in your receipt'
      @receipt = receipt
      render 'new'
    end
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  private

  def receipt_params
    params.require(:receipt).permit(:first_name,
                                    :last_name,
                                    :email,
                                    :phone,
                                    :address,
                                    :city,
                                    :state,
                                    :zip)
  end
end
