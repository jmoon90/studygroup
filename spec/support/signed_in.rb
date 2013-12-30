module SignInHelper
  def sign_in(user)
    visit root_path
    first(:link, 'Hartl').click
    log_in_user(user)
  end

  def better_sign_in(user)
    visit root_path
    log_in_user(user)
  end

  def sign_out(user)
    logout_user(user)
  end
end
