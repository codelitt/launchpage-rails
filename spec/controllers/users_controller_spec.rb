require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:valid_attributes) {
    {email: "test@test.com", usertype: 1}
  }

  let(:invalid_attributes) {
    {email: "", usertype: nil}
  }

  let(:valid_session) { {} }

  let(:user) do
    create(:user)
  end

  let (:valid_token) {{:token => "i0nlyPass"}}

  let (:invalid_token) {{:token => "!ntrud3r"}}

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new user" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "with valid token" do
    describe "GET index" do
      it "assign all users to @users" do
        user.save
        get :index, valid_token
        expect(assigns(:users)).to match_array(User.all)
      end

      it "renders the index template" do
        get :index, valid_token
        expect(response).to render_template("index")
      end
    end

    describe "GET csv" do
      render_views
      it "downloads csv" do
        get :export_csv, valid_token, :format => :csv
        expect(response.content_type).to eq('text/csv')
      end

      it "has correct column headers and has users" do
        user.save
        get :export_csv, valid_token, :format => :csv
        user_col = [user.email, user.usertype].join(",")
        expect(response.body).to eq("Email,UserType\n#{user_col}\n")
      end
    end
  end

  describe "with invalid token" do
    describe "GET index" do
      it "restricts access and returns error message" do
        get :index, invalid_token
        expect(response.body).to eq("You Shall Not Pass!")
      end
    end

    describe "GET csv" do
      it "restricts access and returns generic message" do
        get :export_csv, invalid_token
        expect(response.body).to eq("You Shall Not Pass!")
      end
    end
  end
end
