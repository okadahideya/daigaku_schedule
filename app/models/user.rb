class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subjects
  has_many :subject_details, dependent: :destroy
  with_options presence: true do
    validates :university
    validates :undergraduate
    validates :department
  end
end
