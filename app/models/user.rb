class User < ApplicationRecord
    has_many :created_events, :foreign_key => :creator_id, :class_name => 'Event'
	#has many created events. Created events est donc la foreign key creator_id qui se trouve dans la table Event
	has_and_belongs_to_many :attended_events, :class_name => 'Event', :join_table => :events_users
	#has_and_belongs_to_many :attended_events. Ma clé de liaison est la clé qui correspond à ma table 'Event' dans ma join_table (event_id).
	validates :name,  presence: true, length: { maximum: 50 }
end
