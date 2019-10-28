class User < ApplicationRecord
	#j'effectue ma relation: 1 utilisateur appartient à 1 ville
	belongs_to :city
	#l'utilisateur peut avoir écrit plusieur gossips
	has_many :gossips
	#qu'un user peut envoyer plusieur message et recevoir plusieur message
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "MessagePrive"
	has_many :received_messages, foreign_key: 'recipient_id', class_name: "MessagePrive"
end
