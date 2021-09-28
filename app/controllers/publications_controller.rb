class PublicationsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show ]
  before_action :set_publication, only: %i[ show edit update destroy ]
  before_action :verify_user, only: [:edit, :update, :destroy]
  before_action :can_create_publication, only: [:new, :create]


  def index
    @publications = Publication.all
  end

  def show
    if current_user.present?
      @favorite = current_user.favorites.find_by(publication_id: @publication.id)
    end
      @comments = @publication.comments
      @comment = @publication.comments.build
  end

  def new

    @publication = Publication.new

  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params.merge(user_id: current_user))
    #@publication = Publication.new(publication_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_publication
      @publication = Publication.find(params[:id])
    end


  def verify_user
      unless current_user ==  @publication.user
      flash[:danger] = "vous ne pouvez pas faire cette action !"
      redirect_to root_path
      end
  end

  def can_create_publication
    unless current_user && current_user.user_role == "admin" || current_user && current_user.user_role == "author"
      redirect_to publications_url, notice: "you are not allowed to create publication"
    end
  end

  def publication_params
      params.require(:publication).permit(:title, :content, :image, :image_cache, :date, :category_id)
  end


end
