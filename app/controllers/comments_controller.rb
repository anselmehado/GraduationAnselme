class CommentsController < ApplicationController
  # An action to save and post a comment.
  def create
    # Search Blog from the parameter value and build it as comments associated with Blog.
    @publication = Publication.find(params[:publication_id])
    @comment = @publication.comments.build(comment_params)
    # Change format according to client request
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to publication_path(@publication), notice: 'Couldn't post...' }
      end
    end
  end


  def edit
    @comment = @publication.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'Editing comment'
      format.js { render :edit }
    end
  end
  def update
    @comment = @publication.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'Comment edited'
          format.js { render :index }
        else
          flash.now[:notice] = 'Failed to edit comment'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'Comment deleted'
      format.js { render :index }
    end
  end






  private
  # Strong parameters
  def comment_params
    params.require(:comment).permit(:publication_id, :content,:name,:email)
  end
end
