module MixPanel

  require 'mixpanel-ruby'

  module ClassMethods
  end

  module InstanceMethods

  	def mix_panel(user,event)

			tracker = Mixpanel::Tracker.new(Rails.application.secrets.mix_panel_token)

			# Send an update to User1's profile
			tracker.track(user.email, event)
      	tracker.people.set(user.email, {
			    '$first_name' => user.first_name,
			    '$last_name' => user.last_name,
			    '$email' => user.email,
	      })
	  end	

	  def mix_panel_view_home_page(user,event)
	  	tracker = Mixpanel::Tracker.new(Rails.application.secrets.mix_panel_token)

			# Send an update to User1's profile
      	tracker.track(user.email, event)

      	tracker.people.set(user.email, {
			    '$first_name' => user.first_name,
			    '$last_name' => user.last_name,
			    '$email' => user.email,
			    # '$company' => user.try(:company).try(:legal_business_name),
	      })
	  end	
	 end

  	def self.included(receiver)
   	 receiver.extend         ClassMethods
     receiver.send :include, InstanceMethods
  	end
	
end