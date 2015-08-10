require 'rails_helper'
require 'spec_helper'

describe "Static pages" do


  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('SOME TODO LIST') }
    it { should have_title(full_title('')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Sign in"
    expect(page).to have_title(full_title('Sign in'))
    click_link "Home"
    expect(page).to have_title(full_title(''))
    click_link "Sign up now!"
    expect(page).to have_title(full_title(''))
    click_link "Ruby Garage"
    expect(page).to have_title(full_title(''))
  end
end
