class Contact < SalesforceModel
	self.table_name =  ENV['HEROKU_SF'] + '.contact'
end
