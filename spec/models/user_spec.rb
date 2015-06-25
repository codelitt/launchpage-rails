require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:user) do
    create(:user)
  end

  describe 'When email' do

    it "is not present" do
      expect(build(:user_with_blank_email)).to be_invalid
    end

    it "should be invalid" do
      addresses = %w[user@foo,com user_at_bar.org this.user@blah.]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to be_invalid
      end
    end

    it "format is valid" do
      addresses = %w[me@foo.com A_FINE_USER@f.b.org my.humps@blog.jp a+b@bots.gr]
      addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end

    it "is already taken" do
      user.save
      expect(User.new(user.attributes)).to be_invalid
    end
  end

  describe 'When status' do

    it 'is 1 witch means ...' do
      user.usertype = 1
      expect(user).to be_valid
    end

    it 'is 2 witch means ...' do
      user.usertype = 2
      expect(user).to be_valid
    end

    it 'is other than 1 or 2' do
      user.usertype = 5
      expect(user).to be_invalid
    end
  end
end
