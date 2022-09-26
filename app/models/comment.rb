class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def post_update
    # A method that updates the posts counter for a user.
    user.increment!(:posts_counter)
  end
end
