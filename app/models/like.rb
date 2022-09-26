class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def likes_update
    # A method that updates the likes counter for a post.
    post.update(likes_counter: post.likes.count)
  end
end
