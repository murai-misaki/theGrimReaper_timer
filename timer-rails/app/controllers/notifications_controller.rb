class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: %i[create show update]

  def create
    notification = current_user.build_notification(notification_params)

    if notification.save
      hash = NotificationSerializer.new(notification).serializable_hash
      render json: hash, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: notification.errors.messages }, status: :bad_request
    end
  end

  def show
    notification = current_user.notification

    if notification
      hash = NotificationSerializer.new(notification).serializable_hash
      render json: hash, status: :ok
    end
  end

  def update
    notification = current_user.notification

    if notification.update(notification_params)
      hash = NotificationSerializer.new(notification).serializable_hash
      render json: hash, status: :ok
    else
      render json: { message: '更新出来ませんでした', errors: notification.errors.messages }, status: :bad_request
    end
  end

  private

  def notification_params
    params.permit(:way)
  end

end
