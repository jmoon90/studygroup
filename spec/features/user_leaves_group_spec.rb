feature 'User leaves group' do
  given!(:group) { FactoryGirl.create(:group) }
  given(:user) { FactoryGirl.create(:user) }

  def join_group
    first(:link, 'Join Group').click
  end

  def leave_group
    first(:link, 'Leave Group').click
  end

  before :each do
    log_in_user(user)
    join_group
  end

  scenario 'user leaves group' do
    leave_group
    expect(page).to have_content("Sorry to see you leave")
  end
end
