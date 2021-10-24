require 'rails_helper'

RSpec.feature 'Resend activation email', type: :feature do
  let(:user) { create(:user) }

  scenario 'success' do
    visit new_user_activation_path
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button t('activate')
    expect(page).to have_selector '#notice', text: t('check_email_activate')
    visit email_link
    expect(page).to have_selector '#notice', text: t('activate_success')
  end

  scenario 'failed' do
    visit new_user_activation_path
    fill_in 'email', with: 'hogehoge'
    fill_in 'password', with: ''
    click_button t('activate')
    expect(page).to have_selector '#alert', text: t('authenticate_failed')
  end

  scenario 'when already activate' do
    user.activate!
    visit new_user_activation_path
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button t('activate')
    expect(page).to have_selector '#notice', text: t('already_activated')
  end
end
