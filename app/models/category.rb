class Category < SalesforceModel

	self.table_name = 'salesforce.category__c'

	has_many :products, dependent: :destroy
	validates :name, presence: true
	validates :name, uniqueness: true
end
