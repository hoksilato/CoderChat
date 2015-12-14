class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User', :foreign_key => 'sender_id'
  belongs_to :recipient, :class_name => 'User', :foreign_key => 'recipient_id'

  validates :body, presence: true, length: { minimum: 5 }
  validates_associated :recipient
  validates_associated :sender

  def read
    self.update_attribute(:read, true)
  end
end
