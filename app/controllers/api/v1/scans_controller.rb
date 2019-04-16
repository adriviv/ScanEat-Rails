class Api::V1::ScansController < Api::V1::BaseController
def index
    @scans = current_user.scans.all
   #  @project.user = current_user ??
 end

  def show
  end



end
