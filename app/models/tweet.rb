class Tweet < ActiveRecord::Base
	validates :message, presence: true, length: { maximum:140 }
	validates :author, presence: true
end
