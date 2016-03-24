class Api::V1::TopicsController < Api::V1::BaseController

  before_action :authenticate_user, except: [:index, :show]
  before_action :authorized_user, except: [:index, :show]

  def index
    topics = Topic.all
    render json: topics.to_json, status: 200
  end

  def show
    topic = Topic.find_by(id: params[:id])
    render json: topic.to_json, status: 200
  end
end
