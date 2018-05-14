class Contact < SalesforceModel
	self.table_name =  ENV['HEROKUCONNECT_SCHEMA'] + '.contact'
end
