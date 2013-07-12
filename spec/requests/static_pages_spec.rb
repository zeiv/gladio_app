require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  let(:base_title) { "Gladio" }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "About page" do
    before { visit about_path}
    let(:heading) { 'About Us' }
    let(:page_title) { 'About Us' }

    it_should_behave_like "all static pages"
  end

  describe "Blog page" do
    before { visit blog_path}
    let(:heading) { 'Gladio Blog' }
    let(:page_title) { 'Blog' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path}
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact Us' }

    it_should_behave_like "all static pages"
  end

  describe "Help page" do
    before { visit help_path}
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "Home page" do
    before { visit root_path}
    let(:heading) { 'Gladio App' }
    let(:page_title) { 'Home' }

    it_should_behave_like "all static pages"
  end

  describe "New page" do
    before { visit new_path}
    let(:heading) { 'New' }
    let(:page_title) { 'New' }

    it_should_behave_like "all static pages"
  end
end