class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: %i[create edit update]

  def create
    notification = current_user.build_notification(notification_params)

    if notification.save
      render json: { id: notification.id, email: current_user.email, message: '成功しました' }, status: :ok
    else
      render json: { message: '保存出来ませんでした', errors: notification.errors.messages }, status: :bad_request
    end
  end

  def edit
    notification = current_user.notification

    if notification
      render json: { id: notification.id, way: notification.way }, status: :ok
    end
  end

  def update
    notification = current_user.notification

    if notification.update(notification_params)
      render json: { id: notification.id, way: notification.way, message: '成功しました' }, status: :ok
    else
      render json: { message: '更新出来ませんでした', errors: notification.errors.messages }, status: :bad_request
    end
  end

  private

  def notification_params
    params.permit(:way)
  end

end
