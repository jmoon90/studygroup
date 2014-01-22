require 'spec_helper'

feature 'user views post' do
  given(:user) { FactoryGirl.create(:user) }
  given(:post) { FactoryGirl.create(:post) }

  scenario "see's edit if it is their post" do
    log_in_user(post.user)
    visit post_path(post)

    expect(page).to have_content("Edit Post")
  end

  scenario "doesn't see's edit if it isn't their post" do
    visit post_path(post)

    expect(page).to_not have_content("Edit Post")
  end

  context 'that they created' do
    before(:each) do
      user = FactoryGirl.create(:user)
      post = FactoryGirl.create(:post, user_id: user.id)
      visit edit_post_path(post)
    end

    scenario 'with valid information' do
      fill_in 'Title', with: "New title"
      fill_in 'Description', with: "New info"
      fill_in 'Tag list', with: "more, tags"
      click_on 'Update Post'

      expect(page).to have_content('Successfully edited post')
    end
  end
end

