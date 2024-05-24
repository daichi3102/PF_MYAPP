class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  def show
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_path, notice: t('defaults.flash_message.updated', item: t('profiles.show.title'))
    else
      flash.now[:alert] = t('defaults.flash_message.not_updated', item: t('profiles.show.title'))
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
