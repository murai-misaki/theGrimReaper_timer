class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    like = Like.new(message_id: params[:id], user_id: current_user.id)

    if like.save
      hash = LikeSerializer.new(like).serializable_hash
      render json: hash, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: like.errors.messages }, status: :bad_request
    end
  end

  def destroy
    like = current_user.likes.find(params[:id])

    if like.destroy
      hash = LikeSerializer.new(like).serializable_hash
      render json: hash, status: :ok
    else
      render json: { message: '削除できませんでした', errors: like.errors.messages }, status: :bad_request
    end
  end
end
