class ProductsController < ApplicationController
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_permit)
    if @product.save
      redirect_to products_path
    else
      render action: :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params_permit)
      render action: :show
    else

    end
  end

  def destroy
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html{
        if @product.destroy
          redirect_to products_path
        end
      }
      format.js{
        if @product.destroy
          
        end
      }
    end
  end

  private
  def params_permit
    params.require(:product).permit(:name, :price)
  end
end
