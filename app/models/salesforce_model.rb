class SalesforceModel < ActiveRecord::Base
    self.abstract_class = true
    self.inheritance_column = 'rails_type'

	def hc_errors
		HerokuconnectTriggerLog.where(:record_id => self.id, :state => 'FAILED').order("id DESC").all	
	end	

	def hc_last_error
		errs = cc_errors()
		if errs[0]
			errs[0].sf_message
		else
			nil
		end
	end
end

class HerokuconnectTriggerLog < SalesforceModel
	self.table_name = '_trigger_log'

	def self.pending
		HerokuconnectTriggerLog.where(:state => 'NEW').count
	end

end