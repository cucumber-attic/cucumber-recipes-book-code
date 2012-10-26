module SqueakerDriver
  def create_user_named(username)
    visit '/'
    click_link 'create an account'
    fill_in 'Username', with: username
    click_button 'Create My Account'
    click_button 'Log Out'
  end

  def log_in_as(username)
    visit '/'
    click_link 'log in'
    fill_in 'Username', with: username
    click_button 'Log in'
  end
end

World(SqueakerDriver)
