# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :notification, dependent: :destroy
  has_one :total_shortened_lifespan, dependent: :destroy
  has_many :one_day_times, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, uniqueness: true
end
