class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   def self.sign_in_count_graph_data
   	r = {}
   	User.all.each do |u|
   		r[u.email] = u.sign_in_count
   	end
   	r
   end
end
