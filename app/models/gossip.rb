class Gossip < ApplicationRecord
	#La relation est qu'un gossip est écrit pas un seul user
	belongs_to :user
	#mais qu'un gossip peut avoir plusieur tag
	has_many :tag_gossips
	has_many :tags, through: :tag_gossip
end
