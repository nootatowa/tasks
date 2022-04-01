class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to :root
  else
    render :edit
  end
  end
   private
    def user_params
    params.require(:user).permit(:name)
    end
end
