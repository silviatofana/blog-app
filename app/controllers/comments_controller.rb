class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    redirect_to user_posts_path(id: @comment.post_id, user_id: @comment.author_id) if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    @post = Post.find(@comment.post_id)

    flash[:success] = ['Comment Deleted Successfully']
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to "/users/#{current_user.id}/posts/#{@post.id}" }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author_id, :post_id)
  end
end
