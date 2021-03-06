require 'spec_helper'

describe "Authentication" do
  subject {page}

  describe "signin page" do
  	before {visit signin_path}

  	it { should have_selector( 'h1',    text: 'Sign in')}
  	it { should have_selector( 'title', text: 'Sign in')}
  end

  describe "signin" do
  	before {visit signin_path}

  	describe "with invalid information" do
  		before {click_button "Sign in"}

  		it {should have_selector('title', text: 'Sign in')}
  	end

  	describe "with valid information" do
  		let(:user) {User.create(user_name: 'daniel haugen', 
       email: 'dan@example.com', 
       password: 'daniel5', 
       password_confirmation: 'daniel5' )}
  		before {sign_in user}

  		it { should have_link('Profile',  href: user_path(user))}
      it { should have_link('Sign out', href: signout_path)}
  		it { should_not have_link('Sign in', href: signin_path)}

      describe "followed by signout" do
        before {click_link "Sign out"}
        it { should have_link("Sign in")}
      end
  	end
  end
end
