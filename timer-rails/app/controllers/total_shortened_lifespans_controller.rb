class TotalShortenedLifespansController < ApplicationController
  before_action :authenticate_user!, only: %i[create show show_ranking update]

  def show
    total_time = current_user.total_shortened_lifespan

    if total_time
      hash = TotalShortenedLifespanSerializer.new(total_time).serializable_hash
      render json: hash, status: :ok
    end
  end

  def show_ranking
    ranking_times = TotalShortenedLifespan.all.includes(:user).order(time: :desc).limit(5)
    ranking_array = build_ranking_array(ranking_times)
    render json: ranking_array, status: :ok
  end

  def create
    total_time = current_user.build_total_shortened_lifespan

    if total_time.save
      hash = TotalShortenedLifespanSerializer.new(total_time).serializable_hash
      render json: hash, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: total_time.errors.messages }, status: :bad_request
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

  def build_ranking_array(ranking_times)
    ranking_times.map do |ranking_time|
      {
        id: ranking_time.id,
        user_id: ranking_time.user.id,
        name: ranking_time.user.name,
        time: ranking_time.time
      }
    end
  end
end
