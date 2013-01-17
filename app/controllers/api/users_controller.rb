class Api::UsersController < Api::ApiController
  respond_to :json

  def update_account
    user = User.find_by_id(params[:id])
    user.name = params[:name]
    render json: user.save
  end
end