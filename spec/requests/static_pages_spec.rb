require 'spec_helper'

describe "Static pages" do

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title("Gladio | About Us")
    end
  end

  describe "Blog page" do

    it "should have the h1 'Gladio Blog'" do
      visit blog_path
      expect(page).to have_content('Gladio Blog')
    end

    it "should have the title 'Blog'" do
      visit blog_path
      expect(page).to have_title("Gladio | Blog")
    end
  end

  describe "Contact page" do

    it "should have the h1 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact Us'" do
      visit contact_path
      expect(page).to have_title("Gladio | Contact Us")
    end
  end

  describe "Help page" do

    it "should have the h1 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("Gladio | Help")
    end
  end

  describe "Home page" do

    it "should have the h1 'Gladio App'" do
      visit root_path
      expect(page).to have_content('Gladio App')
    end

    it "should have the title 'Home'" do
      visit root_path
      expect(page).to have_title("Gladio | Home")
    end
  end

  describe "New page" do

    it "should have the h1 'New'" do
      visit new_path
      expect(page).to have_content('New')
    end

    it "should have the title 'New'" do
      visit new_path
      expect(page).to have_title("Gladio | New")
    end
  end
end