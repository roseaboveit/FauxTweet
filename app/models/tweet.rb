class Tweet < ActiveRecord::Base
	validate :message, presence: true
	validate :author, presence: true
end
