require 'spec_helper'

describe "Static pages" do

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("Gladio | About Us")
    end
  end

  describe "Blog page" do

    it "should have the content 'Gladio Blog'" do
      visit '/static_pages/blog'
      expect(page).to have_content('Gladio Blog')
    end

    it "should have the title 'Blog'" do
      visit '/static_pages/blog'
      expect(page).to have_title("Gladio | Blog")
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact Us'" do
      visit '/static_pages/contact'
      expect(page).to have_title("Gladio | Contact Us")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Gladio | Help")
    end
  end

  describe "Home page" do

    it "should have the content 'Gladio App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Gladio App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("Gladio | Home")
    end
  end

  describe "New page" do

    it "should have the content 'New'" do
      visit '/static_pages/new'
      expect(page).to have_content('New')
    end

    it "should have the title 'New'" do
      visit '/static_pages/new'
      expect(page).to have_title("Gladio | New")
    end
  end
end