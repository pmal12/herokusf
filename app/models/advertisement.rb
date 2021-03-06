class Advertisement < SalesforceModel

  #self.table_name = 'salesforce.advertisement__c'
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :image, :title, presence: true
  validates :title, uniqueness: true
  
end
