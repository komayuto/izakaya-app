class Apps::PostsController < Apps::ApplicationController

  before_action :set_post, only:[:destroy]

  def index
    @posts = Post.search(params[:search])
  end
  
  def show
    set_post
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path(@post), notice: '投稿できました'
    else
      flash.now[:error] =  '投稿できませんでした'
      render :new
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to posts_path, notice: '削除しました。'
  end

  private 
  def post_params
    params.require(:post).permit(:content, :eyecatch)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end