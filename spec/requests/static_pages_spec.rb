require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    it "should have the content 'Twitta'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text  => 'Twitta')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text  => "Twitta | Home")
    end
  end
  describe "Help Page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text  => 'Help')
    end

    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', :text  => "Twitta | Help")
    end
  end
  describe "About page" do
    it "should have the content 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text  => 'About us')
    end
    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title', :text  => "Twitta | About us")
    end
  end
  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text  => 'Contact')
    end
    it "should have the right title" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text  => "Twitta | Contact")
    end
  end
end
