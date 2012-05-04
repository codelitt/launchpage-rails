require 'spec_helper'

describe User do

	before do 
		@user = User.new(email: "user@example.com")
	end
	
	subject { @user }
	
	it { should respond_to(:email) }
	it { should be_valid }
	
	describe "when email not present" do 
		before { @user.email = " " }
		it { should_not be_valid }
	end
	
	describe "when email format is invalid" do 
		it "should be invalid" do 
			addresses = %w[user@foo,com user_at_bar.org this.user@blah.]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				@user.should_not be_valid
			end
		end
	end
	
	describe "when a email format is valid" do 
		it "should be valid" do 
			addresses = %w[me@foo.com A_FINE_USER@f.b.org my.humps@blog.jp a+b@bots.gr]
			addresses.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid 
			end
		end
	end
	
	describe "when email is already taken" do 
		before do 
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase 
			user_with_same_email.save  
		end
		
		it { should_not be_valid }
	end
end
