class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request!
  before_action :set_user, except: [:index, :create]

  def index
    users = params[:sort_by].present? ? User.active_users.order(params[:sort_by]) : User.active_users
    render_json({success: true, users: users.map(&:user_response)})
  end

  def create
    @user = User.create(user_params.merge({password_confirmation: params[:password]}))
    if @user
      render_json({ success: true, user: @user.user_response })
    else
      render_json({ success: false})
    end
  end

  def show
    render_json({ success: true, user: @user.user_response})
  end

  def update
    @user.update(user_params)
    render_json({ success: true, user: @user.user_response})
  end

  def destroy
    @user.destroy
    render_json({ success: true})
  end

  def add_tags
    Tag.where(name: params[:tags]).pluck(:id).each { |id| @user.users_tags.create(tag_id: id) }
    if @user.users_tags.present?
     render_json({ success: true})
    else
      render_json({success: false})
    end
  end

  def remove_tags
    tags_ids = Tag.where(name: params[:tags]).pluck(:id)
    if tags_ids.present?
     @user.users_tags.where(tag_id: tags_ids).destroy_all
     render_json({ success: true})
    else
      render_json({ success: true})
    end
  end


  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :is_active)
  end

  def set_user
    user_id = params[:id] || params[:user_id]
    @user = User.find(user_id)
  end
end