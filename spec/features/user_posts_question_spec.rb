require 'spec_helper'

feature 'Group post' do
  given!(:membership) { FactoryGirl.create(:membership) }

  context 'user logged in' do
    before(:each) do
      visit group_path(membership.group)
      log_in_user(membership.user)
      click_on 'Join Group'
      click_on 'Create Post'
    end

    scenario 'with valid information' do
      fill_in "Title", with: 'Silly'
      fill_in "Description", with: 'Willy'
      fill_in 'Tag list', with: 'Ch 1'

      click_on "Post"

      expect(page).to have_content("Successfully posted to post")
      expect(Tagging.last.taggable_type).to have_content('Post')
      expect(Post.last.tags).not_to be_empty
    end

    scenario 'with invalid information' do
      click_on "Post"

      expect(page).to have_content("There was an error. Please try again.")
    end

    scenario 'view submitted post in the group' do
      fill_in "Title", with: 'Silly'
      fill_in "Description", with: 'Willy'
      fill_in 'Tag list', with: 'Ch 1'

      click_on 'Post'


      expect(page).to have_content("Successfully posted to post")
      expect(page).to have_content('Silly')
    end
  end

  context 'views tags' do
    scenario 'by clicking on one' do
      post = FactoryGirl.create(:post, group_id: membership.group.id)
      post1 = FactoryGirl.create(:post, title: 'pizza eater', group_id: 9999)
      post2 = FactoryGirl.create(:post, title: 'machine eater', group_id: 9899)
      tag = FactoryGirl.create(:tag)
      tag2 = FactoryGirl.create(:tag, name: 'type')
      post.tags << tag
      post1.tags << tag
      post2.tags << tag2
      visit post_path(post.id)
      first(:link, 'tutorial 1').click

      expect(page).to have_content(post.title)
      expect(page).to have_content(post1.title)
      expect(page).to_not have_content(post2.title)
    end
  end
end

