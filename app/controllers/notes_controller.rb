class NotesController < ApplicationController
  before_action :require_user
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = current_user.notes.includes(:tags).order_by_updated_at.paginate(page: params[:page], per_page: 10)
  end

  def new
    @note = Note.new
  end

  def show
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      flash[:success] = "Note was successfully created"
      redirect_to note_path(@note)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      flash[:success] = "Note was successfully updated"
      redirect_to note_path(@note)
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    flash[:danger] = "Note was successfully deleted"
    redirect_to notes_path
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description, tags: [])
  end
end
