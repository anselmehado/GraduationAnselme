class CommentsController < ApplicationController
  before_action :set_blog, only: [:create, :edit, :update]

  def create
    # Search Blog from the parameter value and build it as comments associated with Blog.
    @publication = Publication.find(params[:publication_id])
    @comment = @publication.comments.build(comment_params)
    # Change format according to client request
    respond_to do |format|
      if @comment.save
        format.js {render :index}
      else
        format.html {redirect_to publication_path(@publication), notice: 'Couldn't post...'}
      end
    end
  end








  private
  # Strong parameters
  def comment_params
    params.require(:comment).permit(:publication_id, :content,:name,:email)
  end

  def set_publication
  @publication = Publication.find(params[:blog_id])
  end
end
