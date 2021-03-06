=begin
  
rescue Exception => e
  
end
class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	@time = Time.now
  end
   def index
    @products = Product.order(:title)
    @counter = session[:counter]
    @counter.nil? ? @counter = 1 : @counter+=1
    session[:counter] = @counter
  end
end

=end

class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  before_action :set_prod, only: :index


  def index
    @cart = current_cart
    if params[:search]
      @products = @products.search(params[:search])
    else
      @products = @products
    end
  end

  # GET /category/:id
  def show
    @category = Category.find_by(params[:category_id__c])
    @products = @category.products
  end

  # GET /product/:id
  def show_prod
    @product = Product.find_by_id(params[:id])

  end

  def set_prod
    @products = Product.order(:name__c)
  end

  def about
  end

end
