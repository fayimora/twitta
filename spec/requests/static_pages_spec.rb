require 'spec_helper'

describe "StaticPages" do
  subject {page}
  describe "Home Page" do
    before {visit root_path }
    it { should have_selector('h1', text: 'Twitta') }
    it { should have_selector('title', text: full_title("Home")) }
  end
  describe "Help Page" do
    before {visit help_path}
    it { should have_selector('h1', text: 'Help') }
    it { should have_selector('title', text: "Twitta | Help") }
  end
  describe "About Page" do
    before { visit about_path }
    it { should have_selector('h1', text: 'About us') }
    it { should have_selector('title', text: "Twitta | About us") }
  end
  describe "Contact Page" do
    before {visit contact_path}
    it { should have_selector('h1', text: 'Contact') }
    it { should have_selector('title', text: "Twitta | Contact") }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    should have_selector 'title', text: full_title('About us')
    click_link "Help"
    should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    should have_selector 'title', text: full_title('Sign up')
    # click_link "twita"
    # should have_selector 'h1', text: 'Twitta'
  end
end
