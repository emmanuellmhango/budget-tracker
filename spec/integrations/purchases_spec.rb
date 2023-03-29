require 'rails_helper'

RSpec.describe 'Purchases', type: :feature do
  describe 'Index' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @category = Category.create!(
        name: 'Hotels',
        icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png',
        user_id: @user.id
      )
      @purchase = Purchase.new(name: 'Accomodation', amount: 10.2, user_id: @user.id, category_ids: [@category.id])

      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit purchases_path(category_id: @category.id, category_name: @category.name)
    end

    it 'should show Categories' do
      expect(page).to have_content('Category Hotels')
    end

    it 'should show the New purchase button' do
      expect(page).to have_content('New purchase')
    end

    it 'should show the add a new purchase link' do
      expect(page).to have_content('New purchase')
    end
  end

  describe 'New' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @category = Category.create!(
        name: 'Hotels',
        icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png',
        user_id: @user.id
      )
      @purchase = Purchase.new(name: 'Accomodation', amount: 10.2, user_id: @user.id, category_ids: [@category.id])

      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit new_purchase_path
    end

    it 'should show the categories checkboxes' do
      expect(page).to have_content('Categories')
    end

    it 'should show the purchase submit button' do
      expect(page).to have_button('Add Purchase')
    end

    it 'should create a new purchase' do
      fill_in 'purchase_name', with: 'Gymn'
      fill_in 'purchase_amount', with: '20'
      click_button 'Add Purchase'
      expect(page).to have_current_path(categories_path)
    end
  end
end
