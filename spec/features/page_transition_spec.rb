require 'rails_helper'

RSpec.feature "About page transition", type: :feature do

  before do
      @user = FactoryBot.create(:user)
  end

  feature 'home page' do 
    before do
      visit root_path
    end

    it 'HomeにWelcome to the Film Shelfが表示される' do
      expect(page).to have_content "Welcome to the Film Shelf"
    end

    it 'Film Shelfってタイトルが表示される' do
      expect(page).to have_title "Film Shelf"
    end
  end

  feature 'signup page' do 
    before do
      visit signup_path
    end

        it 'Sign upが現れる' do
          expect(page).to have_content "Sign up"
        end

        it 'Sign up | Film Shelfってタイトルが表示される' do
          expect(page).to have_title "Sign up | Film Shelf"
        end

        it 'ボタンのCreate my accountがある' do
          expect(page).to have_button "Create my account"
        end

        feature 'new createした時の挙動' do
          before do
            fill_in 'Name',         with: 'buta'
            fill_in 'Email',        with: 'buta@buta.com'
            fill_in 'Password',     with: 'butasandesu'
            fill_in 'Confirmation', with: 'butasandesu'
            click_button 'Create my account'
          end

      

          it '成功するとWelcome to the Sample App!がでる' do
            expect(page).to have_content "Welcome to the Sample App!"
          end
        end



        feature 'new createに失敗した時の挙動テスト' do
          before do
            fill_in 'Name',         with: 'kuma'
            fill_in 'Email',        with: 'buta@buta.com'
            fill_in 'Password',     with: 'kumasandesu'
            fill_in 'Confirmation', with: 'butasandesu'
            click_button 'Create my account'
          end

          it 'signup_pathに遷移する' do
            expect(current_path).to eq signup_path
          end

          it "passwordが違うとエラーメッセージがでる" do
            expect(page).to have_content "Password confirmation doesn't match Password"
          end
        end
   end
end