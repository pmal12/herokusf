class Contact < SalesforceModel
	self.table_name =  ENV['HEROKUCONNECT_SF'] + '.contact'
end
