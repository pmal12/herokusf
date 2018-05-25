class CartItemsController < ApplicationController
  skip_before_action :authorize, only: [:create, :destroy]
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json

  def index
    @cart_items = CartItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    
  end

  # GET /line_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id])
    @cart_item = @cart.add_product(product.id)
    session[:counter] = 0
    
    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to store_url }
        format.js { @current_item = @cart_item }
        format.json { render action: 'show', status: :created, location: @cart_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to store_url }
      format.js
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.require(:cart_item).permit(:product_id)
    end
end
