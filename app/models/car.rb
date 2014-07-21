class Car < ActiveRecord::Base
  belongs_to :user
  serialize :data
  default_scope -> { order('created_at DESC') }
  validates :vin, presence: true, length: { is: 17 }
  validates :user_id, presence: true
end
