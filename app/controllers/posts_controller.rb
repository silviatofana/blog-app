class PostController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.includes(:posts).find(user_id)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments, [:user]).find(params[:id])
    @likes = @post.likes.all
  end

  def new
    @current = current_user
  end

  def create
    new_post = current_user.posts.build(post_params)

    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to user_post_path(new_post.user_id, new_post.id), notice: 'Post was successfully created.'
        else
          render :new, alert: 'Post was not created.'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
