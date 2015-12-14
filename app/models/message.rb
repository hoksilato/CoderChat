class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User', :foreign_key => 'sender_id'
  belongs_to :recipient, class_name: 'User', :foreign_key => 'recipient_id'

  validates :body, presence: true, length: { minimum: 5 }

  def mark_read
    self.read = true
    self.read_at = DateTime.now
    self.save
  end
end
