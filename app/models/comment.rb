class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_comments_counter

  after_destroy :decrease_post_comment_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def decrease_post_comment_counter
    post.decrement!(:comments_counter) unless post.comments_counter.zero?
  end
end
