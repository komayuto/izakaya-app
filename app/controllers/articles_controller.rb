class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    # viewsのindexの設定
    @articles = Article.all
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      # @articleの情報を.saveで保存をしている
      redirect_to article_path(@article), notice: '保存できました。'
        # redirect_toで指定したリンクに飛ばすと言う意味でartidle_pathに飛ばすと言う意味。notice: 内容 で保存されたら内容を表示すると言う意味
    else
      flash.now[:error] = '保存に失敗しました。'
      render :new
        # render :newはnewの画面を表示すると言う意味。上の文では保存されなかったらnewの画面を表示という意味
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])

    if @article.update(article_params)

      redirect_to article_path(@article), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

    def destroy
      article = current_user.articles.find(params[:id])

      article.destroy!

      redirect_to root_path, notice: '削除しました'
    end

  # privateはデータを保存する際に使う
  private
  def article_params
    params.require(:article).permit(:title, :content, :eyecatch)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end