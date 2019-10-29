class Gossip < ApplicationRecord
	#La relation est qu'un gossip est écrit pas un seul user
	belongs_to :user
	#mais qu'un gossip peut avoir plusieur tag
	has_many :tag_gossips
	has_many :tags, through: :tag_gossip

 #je met mes validations
 validates :title,
 presence: true,
 length: { minimum: 3, maximum: 14 }

 validates :content,
 presence: true

end
