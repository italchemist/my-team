class Api::MembersController < Api::ApiController
  respond_to :json

  def index
    render json: collection.map { |t| to_json(t) }
  end

  def join
    # todo: #41 проверять чтобы не вступали повторно
    render json: Membership.create(team_id: params[:team_id], user_id: current_user.id)
  end

  def dismiss
    # todo: кажется другой статус дожен быть
    Membership.find_by_team_id_and_user_id(params[:team_id], params[:user_id]).delete()
    render json: {}
  end  

  def collection
    Membership.where(:team_id => params[:team_id])
  end

  def to_json(t)
    { user_id: t.user.id, email: t.user.email }
  end  
end