require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'Index' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @category1 = Category.create!(
        name: 'Hotels',
        icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png',
        user_id: @user.id
      )

      @category2 = Category.create!(
        name: 'Restaurants',
        icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png',
        user_id: @user.id
      )

      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit categories_path
    end

    it 'should show all categories' do
      expect(page).to have_content('Hotels')
      expect(page).to have_content('Restaurants')
    end

    it 'should show the Category Manage button' do
      expect(page).to have_content('Manage')
    end

    it 'should show the add a new category link' do
      expect(page).to have_content('add a new category')
    end

    it 'should add a new category' do
      click_link('add a new category')
      expect(page).to have_current_path(new_category_path)
    end
  end

  describe 'New' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @category = Category.create!(
        name: 'Restaurants',
        icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png',
        user_id: @user.id
      )

      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit new_category_path
    end

    it 'should show the category name field' do
      expect(page).to have_content('New Category')
    end

    it 'should show the food submit button' do
      expect(page).to have_button('Add Category')
    end

    it 'should create a new category' do
      fill_in 'category_name', with: 'Restaurants'
      fill_in 'category_icon', with: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png'
      click_button 'Add Category'
      expect(page).to have_current_path(categories_path)
    end
  end
end
