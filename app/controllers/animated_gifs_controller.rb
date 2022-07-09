class AnimatedGifsController < ApplicationController
  before_action :set_animated_gif, only: %i[edit update destroy ]

  # GET /animated_gifs or /animated_gifs.json
  def index
    @animated_gifs = AnimatedGif.all
  end

  # GET /animated_gifs/1 or /animated_gifs/1.json
  def show
    @animated_gif = AnimatedGif.find(params[:id])

    respond_to do |format|
      format.html
      format.json{render json: @animated_gif}
      format.gif do
        blob = @animated_gif.generate()
        send_data blob, type: 'image/gif', disposition: 'inline'

      end
    end
  end

  # GET /animated_gifs/1 or /animated_gifs/1.json
  def generate
    send_data blob, type: 'image/gif', disposition: 'inline'
  end


  # GET /animated_gifs/new
  def new
    @animated_gif = current_user.animated_gifs.new
  end

  # GET /animated_gifs/1/edit
  def edit
  end

  # POST /animated_gifs or /animated_gifs.json
  def create
    @animated_gif = current_user.animated_gifs.new(animated_gif_params)

    respond_to do |format|
      if @animated_gif.save
        format.html { redirect_to animated_gif_url(@animated_gif), notice: "Animated gif was successfully created." }
        format.json { render :show, status: :created, location: @animated_gif }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animated_gif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animated_gifs/1 or /animated_gifs/1.json
  def update
    respond_to do |format|
      if @animated_gif.update(animated_gif_params)
        format.html { redirect_to animated_gif_url(@animated_gif), notice: "Animated gif was successfully updated." }
        format.json { render :show, status: :ok, location: @animated_gif }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animated_gif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animated_gifs/1 or /animated_gifs/1.json
  def destroy
    @animated_gif.destroy

    respond_to do |format|
      format.html { redirect_to animated_gifs_url, notice: "Animated gif was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animated_gif
      @animated_gif = current_user.animated_gifs.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animated_gif_params
      params.require(:animated_gif).permit(:user_id, :title, :description)
    end
end
