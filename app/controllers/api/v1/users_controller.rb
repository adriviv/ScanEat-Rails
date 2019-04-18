class Api::V1::UsersController < Api::V1::BaseController

  def create
    code_object = CodeLookup.new(code_params)
    code_parsed = code_object.get_code_infos
    puts "code_parsed #{code_parsed}"


###### IF STATEMENT IF IT EXIST #######
####### ONLY CREATE THE OPENID NOT THE SESSIONS_KEY   #########
puts "#{code_parsed}"
    @user = User.find_or_create_by({openid: code_parsed["openid"]})

    if @user.save
      # @scan = Scan.new(user_id: 1, food_id: @food.id)
      render json: code_parsed, json: @user, status: :created
    else
      render_error
    end


  end

  private
  def code_params
    params.require(:code)
  end


end
