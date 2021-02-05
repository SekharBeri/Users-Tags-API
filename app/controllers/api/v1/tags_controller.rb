class Api::V1::TagsController < ApplicationController
  before_action :authenticate_request!
  before_action :set_tag, only: [:edit, :destroy, :show, :update]

  def index
    @tags = params[:sort_by].present? ? Tag.order(params[:sort_by]) : Tag.all
    render_json({ success: true, tags: @tags.map})
  end

  def create
    @tag = Tag.create(tags_params)
  end

  def show
    render_json({ success: true, tag: @tag})
  end

  def update
    @tag.update(tags_params)
    render_json({success: true, message: "Tag Updated"})
  end

  def destroy
    @tag.destroy
    render_json({ success: true, message: "Tag Deleted"})
  end

  private
  
  def tags_params
    params.permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
