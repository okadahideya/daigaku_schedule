class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.guest
    find_or_create_by!(email: 'gesto@gmail.com')
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subjects
  has_many :subject_details, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :questions, dependent: :destroy
  
  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, format: { with: PASSWORD_REGEX, message: 'はアルファベットと数字を含めてください' }, length: { minimum: 6 }, on: :create
    validates :nickname
    validates :university
    validates :undergraduate
    validates :department
    validates :name
    validates :name_k
  end
end
