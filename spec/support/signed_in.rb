module SignInHelper
  def sign_in(user)
    visit root_path
    first(:link, 'Hartl').click
    log_in_user(user)
    first(:link, 'join').click
  end
end
