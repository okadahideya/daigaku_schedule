class Professor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.guest
    find_or_create_by!(email: 'gesto@gmail.com')
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :lectures, dependent: :destroy
  has_many :lecture_details, dependent: :destroy
  has_many :answers, dependent: :destroy

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, format: { with: PASSWORD_REGEX, message: 'はアルファベットと数字を含めてください' }, length: { minimum: 6 }, on: :create
    validates :university_p
    validates :undergraduate_p
    validates :department_p
    validates :name_p
    validates :name_k_p
  end
end
