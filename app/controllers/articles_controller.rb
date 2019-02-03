class ArticlesController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_article, only: [:edit, :update, :destroy, :show]

  def index
    @articles = Article.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to controller: :articles, action: :index
  end

  def destroy
    @article.destroy if @article.user_id == current_user.id
  end

  def edit
  end

  def update
    @article.update(article_params) if @article.user_id == current_user.id
    redirect_to controller: :articles, action: :index
  end

  def show
    @comments = @article.comments.includes(:user)
  end

  private
  def article_params
    params.require(:article).permit(:title,:text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
