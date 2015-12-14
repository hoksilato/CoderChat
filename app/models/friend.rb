class Friend < ActiveRecord::Base
  belongs_to :from, class_name: 'User', :foreign_key => 'from_id'
  belongs_to :to, class_name: 'User', :foreign_key => 'to_id'

  validates_associated :from
  validates_associated :to
end
