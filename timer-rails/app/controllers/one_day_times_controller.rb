class OneDayTimesController < ApplicationController
  before_action :authenticate_user!, only: %i[create show_today update index]

  def create
    today_time = current_user.one_day_times.build(today_time_params)

    if today_time.save
      hash = OneDayTimeSerializer.new(today_time).serializable_hash
      render json: hash, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: today_time.errors.messages }, status: :bad_request
    end
  end

  def show_today
    today_time = find_today_time

    if today_time
      render json: { id: today_time.id, count_up: today_time.count_up, exercise: today_time.exercise, shortened_lifespan: today_time.shortened_lifespan }, status: :ok
    end
  end

  def show_today_count_up
    today_time = find_today_time

    if today_time
      render json: { count_up: today_time.count_up }, status: :ok
    end
  end

  def show_today_shortened_lifespan
    today_time = find_today_time

    if today_time
      render json: { shortened_lifespan: today_time.shortened_lifespan }, status: :ok
    end
  end

  def update
    today_time = current_user.one_day_times.find(params[:id])

    if today_time.update(today_time_params)
      hash = OneDayTimeSerializer.new(today_time).serializable_hash
      render json: hash, status: :ok
    else
      render json: { message: '更新出来ませんでした', errors: today_time.errors.messages }, status: :bad_request
    end
  end

  def index
    data = build_weekly_data
    render json: data, status: :ok
  end

  private

  def today_time_params
    params.permit(:count_up, :exercise, :shortened_lifespan)
  end

  def find_today_time
    now = Time.current
    current_user.one_day_times.find_by(created_at: now.all_day)
  end

  def build_weekly_data
    now = Time.current
    one_week_times = current_user.one_day_times.where(created_at: now.all_week)

    count_up_array = []
    exercise_array = []
    shortened_lifespan_array = []

    (0..6).each do |day|
      date = now.beginning_of_week + day.days
      time = one_week_times.find { |t| t.created_at.to_date == date.to_date }

      if time.nil?
        count_up_array << 0
        exercise_array << 0
        shortened_lifespan_array << 0
      else
        count_up_array << time.count_up
        exercise_array << time.exercise
        shortened_lifespan_array << time.shortened_lifespan
      end
    end

    {
      count_up: count_up_array,
      exercise: exercise_array,
      shortened_lifespan: shortened_lifespan_array
    }
  end
end
