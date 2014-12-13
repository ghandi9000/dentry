class CommentsController < ApplicationController
  def create
    @tree = Tree.find(params[:tree_id])
    @comment = @tree.comments.create(comment_params)
    redirect_to tree_path(@tree)
  end

  def index
    @comments = Comment.all
  end
  
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
