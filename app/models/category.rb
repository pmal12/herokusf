class Category < SalesforceModel

	self.table_name = 'salesforce.category__c'

	has_many :products, dependent: :destroy
	#validates :title__c, presence: true
	#validates :title__c, uniqueness: true
end
