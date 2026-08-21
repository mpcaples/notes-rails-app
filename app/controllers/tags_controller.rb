class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show ]
 
  
  def index
    @tags = Tag.all
  end

  def show
    @notes = Note.joins(:tags).where(tags: { id: @tag.id })
  end

  # def new
  #   @tag = Tag.new
  # end

  # def edit 
  # end

  # def update 
  #   if @tag.update(tag_params)
  #     redirect_to @note
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end
  
  # def create
  #   @tag = Tag.find_or_create_by(name: tag_params[:name])
  #   @note.tags << @tag unless @note.tags.include?(@tag)
  #   redirect_to @note
  # end

  # def destroy 
  #   @tag = Tag.find(params[:id])
  #   @note.tags.delete(@tag)
  #   redirect_to @note
  # end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end
    def tag_params
      params.expect(tag: [ :name ])
    end
end
