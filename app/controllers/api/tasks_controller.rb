class Api::TasksController < Api::ApiController
  respond_to :json

  def index
    render json: collection.map { |t| to_json(t) }
  end

  def show
    render json: to_json(collection.find_by_id(id))
  end

  def create
    # todo: 28,29 команда должна существовать
    render json: to_json(Task.create(data))
  end

  def update
    # todo: 33 обновлять данные может только участник команды
    render json: to_json(Task.update(id, data))
  end

  def destroy
    # todo: 34 удалять может только участник
    respond_with Task.destroy(id)
  end

  def task_url(task)
    "/tasks/#{task.team_id}/#{task.id}"
  end

  def id
    params[:id]
  end

  def collection
    Task.where(:team_id => params[:team_id])
  end

  def to_json(t)
    { id: t.id, title: t.title, description: t.description }
  end  

  def data
    params[:task].slice(:title, :description, :closed).merge(team_id: params[:team_id])
  end
end