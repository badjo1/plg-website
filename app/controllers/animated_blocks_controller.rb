class AnimatedBlocksController < ApplicationController
  before_action :set_animated_block, only: %i[ edit update destroy ]

  # GET /animated_blocks/new
  def new
    @animated_gif = current_user.animated_gifs.find(params[:animated_gif_id])
    @animated_block = @animated_gif.animated_blocks.new
  end

  # GET /animated_blocks/1/edit
  def edit
  end

  # GET /animated_blocks/1/copy
  def copy
    @animated_block = AnimatedBlock.find(params[:id]).dup
    @animated_block.save
    redirect_to edit_animated_block_url(@animated_block), notice: "Animated block was successfully copied."
  end

  # POST /animated_blocks or /animated_blocks.json
  def create
    @animated_gif = current_user.animated_gifs.find(params[:animated_gif_id])
    @animated_block = @animated_gif.animated_blocks.new(animated_block_params)

    respond_to do |format|
      if @animated_block.save
        format.html { redirect_to animated_gif_url(@animated_gif), notice: "Animated block was successfully created." }
        format.json { render :show, status: :created, location: @animated_block }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animated_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animated_blocks/1 or /animated_blocks/1.json
  def update
    respond_to do |format|
      if @animated_block.update(animated_block_params)
        format.html { redirect_to animated_gif_url(@animated_block.animated_gif_id), notice: "Animated block was successfully updated." }
        format.json { render :show, status: :ok, location: @animated_block }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animated_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animated_blocks/1 or /animated_blocks/1.json
  def destroy
    animated_gif_id = @animated_block.animated_gif_id
    @animated_block.destroy

    respond_to do |format|
      format.html { redirect_to animated_gif_url(animated_gif_id), notice: "Animated block was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animated_block
      @animated_block = AnimatedBlock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animated_block_params
      params.require(:animated_block).permit(:animated_gif_id, :block_word, :block_style)
    end
end
