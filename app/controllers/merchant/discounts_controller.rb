class Merchant::DiscountsController < Merchant::BaseController
  def index
    @merchant = current_user.merchant
  end

  def show
    @discount = Discount.find(params[:id])
  end

  def edit

  end

  def destroy
    Discount.destroy(params[:id])
    flash[:notice] = "Discount deleted"
    redirect_to merchant_discounts_path
  end
end
