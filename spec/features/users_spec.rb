# frozen_string_literal: true

describe 'Users', type: :feature do
  let!(:user) { create(:user, email: 'existing@user.com') }

  context 'when not registered' do
    let(:user_params) { { email: FFaker::Internet.email, password: '00000000' } }

    it 'can create a new user' do
      visit root_path
      click_on 'Sign Up'

      fill_in 'Email',    with: user_params[:email]
      fill_in 'Password', with: user_params[:password]

      click_button 'Create User'

      expect(page).to have_content('User was successfully created.')
    end

    it 'can not create user with same email' do
      visit root_path
      click_on 'Sign Up'

      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user_params[:password]

      click_button 'Create User'

      expect(page).to have_content('Email has already been taken')
    end
  end

  context 'when registered' do
    it 'can successfully sign in' do
      visit root_path
      click_on 'Log In'

      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password

      click_button 'Login'

      expect(page).to have_content("Logged in as #{user.email}")
    end

    it 'can receive an error on wrong email' do
      visit root_path
      click_on 'Log In'

      fill_in 'Email',    with: 'non@existing.com'
      fill_in 'Password', with: user.password

      click_button 'Login'

      expect(page).to have_content('Email or password is invalid')
    end

    it 'can receive an error on wrong password' do
      visit root_path
      click_on 'Log In'

      fill_in 'Email',    with: user.email
      fill_in 'Password', with: 'blablabla'

      click_button 'Login'

      expect(page).to have_content('Email or password is invalid')
    end

    it 'can sign out' do
      visit root_path
      click_on 'Log In'

      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password

      click_button 'Login'
      click_on 'Log Out'

      expect(page).not_to have_content("Logged in as #{user.email}")
      expect(page).to have_content('Logged out!')
    end
  end
end
