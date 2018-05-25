class CartItem < SalesforceModel
  #self.table_name = 'salesforce.cart_item__c'
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  #attr_accessible :cart_id, :product_id

  def total_price
  	product.price__c * quantity
  end
end
