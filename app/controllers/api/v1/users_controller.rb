class Api::V1::UsersController < Api::V1::BaseController

  def create
    user_decrypted = WxbizDataCrypt.new
    result = user_decrypted.decrypt(params[:user][:encryptedData], params[:user][:iv])

  @user = User.create!(new_information)

     if @user.save
       render json: {}, status: :created
      else
       render json: @user.errors, status: :bad
     end
  end



  private

  def user_params
    params.require(:user).permit(:iv, :encryptedData)
  end


end
