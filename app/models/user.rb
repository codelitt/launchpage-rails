class User < ActiveRecord::Base
  attr_accessible :email, :usertype
  
  before_save { |user| user.email = email.downcase }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { with: VALID_EMAIL_REGEX },
  								 :uniqueness => { case_sensitive: false } 
 	validates :usertype, :presence => true 
end

#fans have a :type = 1, artists with :type = 2
