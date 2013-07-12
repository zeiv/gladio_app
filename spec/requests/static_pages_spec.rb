require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  let(:base_title) { "Gladio" }

  describe "About page" do
    before { visit about_path}

    it { should have_selector('h1',    text: 'About Us') }

    it "should have the title 'About Us'" do
      expect(page).to have_title(full_title('About Us'))
    end
  end

  describe "Blog page" do
    before { visit blog_path}

    it { should have_selector('h1',    text: 'Gladio Blog') }

    it "should have the title 'Blog'" do
      expect(page).to have_title(full_title('Blog'))
    end
  end

  describe "Contact page" do
    before { visit contact_path}

    it { should have_selector('h1',    text: 'Contact') }

    it "should have the title 'Contact Us'" do
      expect(page).to have_title(full_title('Contact Us'))
    end
  end

  describe "Help page" do
    before { visit help_path}

    it { should have_selector('h1',    text: 'Help') }
    it "should have the title 'Help'" do
      expect(page).to have_title(full_title('Help'))
    end
  end

  describe "Home page" do
    before { visit root_path}

    it { should have_selector('h1',    text: 'Gladio App') }
    it "should have the title 'Home'" do
      expect(page).to have_title(full_title('Home'))
    end
  end

  describe "New page" do
    before { visit new_path}

    it { should have_selector('h1',    text: 'New') }
    it "should have the title 'New'" do
      expect(page).to have_title(full_title('New'))
    end
  end
end