require 'rails_helper'

RSpec.describe FilmsController, type: :controller do

  describe "ログインしていない状態でGET #New" do
    
    it "returns http success" do
      get :new
      expect(response).to_not have_http_status(:success)
    end
  end

  feature "ログインした状態でGET #New" do
    
    before do 
        @user = FactoryBot.create(:user)
        visit login_path
        fill_in 'Email',        with: 'tester1@example.com'
        fill_in 'Password',     with: 'password'
        click_button 'Log in'
    end
    
    it "returns http success" do
      get :register_path
      expect(response).to have_http_status(:success)
    end
  end

end