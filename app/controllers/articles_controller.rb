class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @articles = Article.all 
  end

  def new
    @article = Article.new
  end

	def create
		@article = current_user.articles.create(article_params)
		if @article.valid?
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :category, :content)
  end

end
