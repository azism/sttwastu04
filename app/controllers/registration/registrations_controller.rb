class Registration::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_filter :authenticate_scope!, only: [:edit, :update, :destroy]
  before_action :get_key, only: [:nim_must_exist, :nid_must_exist]
  
  def get_key
    @lecturer = Lecturer.find_by(nid: params[:key])
    @student = Student.find_by(nim: params[:key])
  end
  
  def new
    build_resource({})
    @level = params[:level]
  end
  
  def create
    build_resource(sign_up_params)
    check_level
  end
  
  def check_level
    if @level == 'dosen'
      nid_must_exist
    else
      nim_must_exist
    end
  end
  
  def nid_must_exist
    if @lecturer
      process_save_for_lectuer
    else
      nid_not_found
    end
  end
  
  def nim_must_exist
    if @student
      process_save_for_student
    else
      nim_not_found
    end
  end
  
  def process_save_for_lecturer
    if resource.save
      sign_up_and_create_profile_lecturer
    else
      render :new
    end
  end
  
  def process_save_for_student
    if resource.save
      sign_up_and_create_profile_student
    else
      render :new
    end
  end
  
  def sign_up_and_create_profile_lecturer
    resource.update_attribute(:meta, @lecturer)
    set_flash_message :notice, :signed_up if is_flashing_format?
    redirect_to '/'
    Profile.create! :user_id => @user.id
  end
  
  def sign_up_and_create_profile_student
    resource.update_attribute(:meta, @student)
    set_flash_message :notice, :signed_up if is_flashing_format?
    redirect_to '/'
    Profile.create! :user_id => @user.id
  end
  
  def nid_not_found
    set_flash_message :notice, :nid_not_found if is_flashing_format?
    render :new
  end
  
  def nim_not_found
    set_flash_message :notice, :nim_not_found if is_flashing_format?
    render :new
  end
  
  def edit
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
