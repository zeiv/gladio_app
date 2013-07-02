require 'spec_helper'

describe "Static pages" do
  
  subject { page }

  describe "About page" do
    before { visit about_path}

    it { should have_content('About Us') }

    it "should have the title 'About Us'" do
      expect(page).to have_title("Gladio | About Us")
    end
  end

  describe "Blog page" do
    before { visit blog_path}

    it { should have_content('Gladio Blog') }

    it "should have the title 'Blog'" do
      expect(page).to have_title("Gladio | Blog")
    end
  end

  describe "Contact page" do
    before { visit contact_path}

    it { should have_content('Contact') }

    it "should have the title 'Contact Us'" do
      expect(page).to have_title("Gladio | Contact Us")
    end
  end

  describe "Help page" do
    before { visit help_path}

    it { should have_content('Help') }

    it "should have the title 'Help'" do
      expect(page).to have_title("Gladio | Help")
    end
  end

  describe "Home page" do
    before { visit root_path}

    it { should have_content('Gladio App') }

    it "should have the title 'Home'" do
      expect(page).to have_title("Gladio | Home")
    end
  end

  describe "New page" do
    before { visit new_path}

    it { should have_content('New') }

    it "should have the title 'New'" do
      expect(page).to have_title("Gladio | New")
    end
  end
end