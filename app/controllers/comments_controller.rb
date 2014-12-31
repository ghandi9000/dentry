class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret"
  
  def create
    @tree = Tree.find(params[:tree_id])
    @comment = @tree.comments.create(comment_params)
    redirect_to tree_path(@tree)
  end

  def index
    @comments = Comment.all
  end

  def destroy
    @tree = Tree.find(params[:tree_id])
    @comment = @tree.comments.find(params[:id])
    @comment.destroy
    redirect_to tree_path(@tree)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
