class Lecturer < ActiveRecord::Base
    has_one :user, as: :meta, dependent: :destroy
    accepts_nested_attributes_for :user
    
    def is_nid_exist
      @lecturer = Lecturer.find_by(nid: params[:key])
    end
end
