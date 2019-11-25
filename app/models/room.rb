class Room < ApplicationRecord
    belongs_to :guest, :class_name => 'User', optional: true
    belongs_to :host, :class_name => 'User'
end
