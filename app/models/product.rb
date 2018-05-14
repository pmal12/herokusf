class Product < SalesforceModel

  self.table_name = 'salesforce.product2'
  def self.latest
    Product.order(:updated_at).last
  end
  belongs_to :category
  has_many :cart_items
  has_many :orders, through: :cart_items
  before_destroy :ensure_not_referenced_by_any_cart_item
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  validates :title, :description, :image, :category_id, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true




  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
  end

  private

    # ensure that there are no cart items referencing this product
    def ensure_not_referenced_by_any_cart_item
      if cart_items.empty?
        return true
      else
        errors.add(:base, 'Cart Items present')
        return false
      end
    end
end
