class TotalShortenedLifespansController < ApplicationController
  before_action :authenticate_user!, only: %i[create show update]

  def create
    total_time = current_user.build_total_shortened_lifespan

    if total_time.save
      hash = TotalShortenedLifespanSerializer.new(total_time).serializable_hash
      render json: hash, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: total_time.errors.messages }, status: :bad_request
    end
  end

  def show
    total_time = current_user.total_shortened_lifespan

    if total_time
      hash = TotalShortenedLifespanSerializer.new(total_time).serializable_hash
      render json: hash, status: :ok
    end
  end

  def update
    total_time = current_user.total_shortened_lifespan
    
    if total_time.update(time_params)
      hash = TotalShortenedLifespanSerializer.new(total_time).serializable_hash
      render json: hash, status: :ok
    else
      render json: { message: '更新出来ませんでした', errors: total_time.errors.messages }, status: :bad_request
    end
  end

  private

  def time_params
    params.permit(:time)
  end

end
