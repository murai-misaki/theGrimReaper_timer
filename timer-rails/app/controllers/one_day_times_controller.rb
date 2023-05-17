class OneDayTimesController < ApplicationController
  before_action :authenticate_user!, only: %i[create index]

  def create
    today_time = current_user.one_day_times.build(today_time_params)

    if today_time.save
      render json: { id: today_time.id, email: current_user.email, message: '成功しました' }, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: today_time.errors.messages }, status: :bad_request
    end
  end

  def index
    now = Time.current
    one_week_times = current_user.one_day_times.where(created_at: now.all_week)

    one_week_times_array = one_week_times.map do |time|
      {
        id: time.id,
        count_up: time.count_up,
        exercise: time.exercise,
        shortened_lifespan: time.shortened_lifespan,
        created_at: time.created_at
      }
    end

    render json: one_week_times_array, status: :ok
  end

  private

  def today_time_params
    params.permit(:count_up, :exercise, :shortened_lifespan)
  end

end
