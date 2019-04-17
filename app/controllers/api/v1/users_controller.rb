class Api::V1::UsersController < Api::V1::BaseController

  def create




  @user = User.create!(user_params)

    if @user.save
      render json: response, status: :created
     else
      render json: @user.errors, status: :bad
    end
  end



  private

  def user_params

    params.require(:user).permit(:iv, :encryptedData)

  end
end
