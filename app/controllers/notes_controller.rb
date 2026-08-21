class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]
  
  def index
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @notes = @tag.notes
    else
      @notes = Note.all
    end
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit 
  end

  def update 
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      @note.add_tag(params[:note][:new_tag_name]) if params[:note][:new_tag_name].present?
      redirect_to @note
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy 
    @note.destroy
    redirect_to notes_path
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.expect(note: [ :title, :body, :tag_id ])
    end
end
