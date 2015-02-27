class User < ActiveRecord::Base
	def self.from_omniauth(auth)
		where(uid: auth["uid"]).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
		create!(
			provider: auth["provider"], 
			uid: auth["uid"], 
			name: auth["info"]["nickname"])
	end
end
