class User < ActiveRecord::Base
  has_secure_password

  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id', dependent: :destroy
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id'

  has_many :friends, foreign_key: 'from_id', dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 3 }, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, email: true
end
