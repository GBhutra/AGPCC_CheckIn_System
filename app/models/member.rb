class Member < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, :gender, :classification, presence: true
    validates :email, uniqueness: true
    
    has_many :check_ins, :class_name => CheckIn, :foreign_key => :member_id
    has_many :rsvps, class_name: 'Rsvp', foreign_key: :member_id
    
    GENDER=['Male', 'Female']
    CLASSIFICATION=['Master', 'Ph.D.', 'Undergraduate']
    
    def to_s
        email
    end

end

