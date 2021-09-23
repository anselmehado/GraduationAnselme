class PublicationsController < ApplicationController
  before_action :authenticate_user!, except: [:index ]
  before_action :set_publication, only: %i[ show edit update destroy ]
  #before_action :authenticate_user!


  # GET /publications or /publications.json
  def index
    @publications = Publication.all
  end

  # GET /publications/1 or /publications/1.json

  def show
      
        @favorite = current_user.favorites.find_by(publication_id: @publication.id)
        @comments = @publication.comments
        @comment = @publication.comments.build
  end

  #
  # def show
  #   if current_user.present?
  #     @favorite = current_user.favorites.find_by(publication_id: @publication.id)
  #   end
  #       @comments = @publication.comments
  #       @comment = @publication.comments.build
  # end


  # GET /publications/new
  def new

    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications or /publications.json
  def create

      #@publication = current_user.publications.build(publication_params)
    #@publication = Publication.new(publication_params)


    @publication = Publication.new(publication_params.merge(user_id: current_user.id))

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

  # PATCH/PUT /publications/1 or /publications/1.json
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

  # DELETE /publications/1 or /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    #Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    #
    # def set_publication
    #   unless current_user
    #     @listing = Publicationfind(params[:id])
    #   else
    #     @listing = current_user.Publication.find(params[:id])
    # end
    # end


    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:title, :content, :image, :image_cache, :date, :category_id)
    end
end
