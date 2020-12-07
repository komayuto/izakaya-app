class Apps::TimelinesController < Apps::ApplicationController
  before_action :set_timeline, only: [:show]
  
  def index
    @timelines = Timeline.all
  end
  def show
  end
  def new
    @timeline = current_user.timelines.build
  end
  def create
    @timeline = current_user.timelines.build(timeline_params)
    if @timeline.save
      redirect_to timeline_path(@timeline), notice: '保存できました'
    else
      flash.now[:error] = '保存できませんでした'
      render :new
    end
  end
  def destroy
    timeline = current_user.timelines.find(params[:id])
    timeline.destroy!
    redirect_to timeline_path, notice: '削除しました'
  end

  private
  def timeline_params
    params.require(:timeline).permit(:title, :content, :eyecatch)
  end
  def set_timeline
    @timeline = Timeline.find(params[:id])
  end
end