class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :item_options, dependent: :destroy
  has_many :contacts
  has_many :addresses
  belongs_to :restaurante, optional: true

  def name
    "#{email}"
  end
end
