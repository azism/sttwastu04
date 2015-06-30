class Student < ActiveRecord::Base
    has_one :user, as: :meta, dependent: :destroy
    accepts_nested_attributes_for :user
    
    scope :find_nim, -> { find_by(nim: @key) }
end
