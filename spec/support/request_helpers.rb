module RequestHelper
  include Warden::Test::Helpers
  Warden.test_mode!

  def log_in_user(user)
    login_as user, scope: :user
  end
end
