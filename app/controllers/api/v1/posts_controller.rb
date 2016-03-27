class Api::V1::PostsController < Api::V1::BaseController

  before_action :authenticate_user, except: [:index, :show]
  before_action :authorized_user, except: [:index, :show]

  def index
    posts = Post.all
    render json: posts.to_json, status: 200
  end

  def show
    post = Post.find_by(id: params[:id])
    render json: post.to_json(include: :comments), status: 200
  end
end
