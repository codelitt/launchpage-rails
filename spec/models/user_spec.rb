require 'rails_helper'

RSpec.describe User, :type => :model do

	let(:user) do
		build(:valid_user)
	end

	it "when email not present" do
		user.email = " "
		expect(user).to be_invalid
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_bar.org this.user@blah.]
			addresses.each do |invalid_address|
				user.email = invalid_address
				expect(user).to be_invalid
			end
		end
	end

	describe "when a email format is valid" do
		it "should be valid" do
			addresses = %w[me@foo.com A_FINE_USER@f.b.org my.humps@blog.jp a+b@bots.gr]
			addresses.each do |valid_address|
				user.email = valid_address
				expect(user).to be_valid
			end
		end
	end

	it "when email is already taken" do
		user_with_same_email = User.create(email: "user@example.com", usertype: 1)
		user.save!
		user_with_same_email.save
		expect(user_with_same_email).to be_invalid
	end
end
