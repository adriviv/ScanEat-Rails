class Api::V1::FavoritesController < Api::V1::BaseController

  def index
    # Get User's favourites
    # @favorites = Favorite.where(user_id: params[:user_id])
    # @food_array =[]
    # @favorites = Favorite.where(user_id: params[:user_id]).joins(:food)


    # @favorites.each do |favorite|
    # food = Food.find(favorite.food_id)
    # # puts favorite
    # # food.favorite_ids = favorite.id
    #   # @fooood.merge!(favorite_id: favorite.id)
    # @food_array << food
    # end

    @favorites = Favorite.find_by_sql("SELECT fa.id as favorite_id, * FROM favorites as fa, foods as f WHERE fa.food_id = f.id AND fa.user_id = " + params[:user_id])
    # @favorites.each do |favorite|
    #   # puts favorite
    #   # food.favorite_ids = favorite.id
    #   # @fooood.merge!(favorite_id: favorite.id)
    #   @food_array << food
    # end

    # favorite_info = @favorites.get_product_infos()
    # @favorite = Favorite.new(favorite_info)
    # Get Food details of each favourite's food




    #construct the result

    render json: @favorites
  end

  def show
  end

  def create
    @user = User.find(params[:user_id])
    @favorite = Favorite.find_or_create_by(favorite_params)
    @favorite.user = @user


    if @favorite.save
      render json: { testing: 123 }
    else
       render_error
     end
  end

  def destroy
    # @favorite = Favorite.where(params[:id])
    Favorite.destroy(params[:id])
    head :no_content
  end

  private

  def favorite_params
    params.require(:favorite).permit(:food_id)
  end

  def render_error
    render json: {errors: @favorite.errors.full_messages}
  end
end
