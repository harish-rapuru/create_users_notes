class TagsController < ApplicationController
  before_action :require_user

  def notes
    @tag = Tag.find params[:id]
    @notes = @tag.notes.includes(:tags).order_by_updated_at.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    @tag = Tag.find params[:id]
    @tag.destroy
    flash[:danger] = "Tag was successfully deleted"
    redirect_to notes_path
  end
end
