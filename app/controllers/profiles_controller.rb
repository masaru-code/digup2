class ProfilesController < AuthController
  before_action :set_profile

  def show

  end

  def edit
    
  end

  def update    
    if @user.update(profile_params)
      redirect_to profiles_path
    else
      render :edit
    end
  end

  private

  def set_profile
    @user = current_user
  end

  def profile_params
    params.require(:user).permit(:avatar, :email)
  end

end

