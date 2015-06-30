class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    role ||= :user
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :meta, polymorphic: true
  has_one :profile, dependent: :destroy
  
  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true

end
