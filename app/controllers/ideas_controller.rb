class IdeasController < ApplicationController
  def index
    @idea = Idea.includes(:tags).all.order('created_at DESC')
    @tags = Idea.tags_on(:tags) 
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      flash[:notice] = "投稿が保存できました"
      redirect_to root_path
    else    
      @idea = Idea.new
      flash.now[:alert] = "投稿できません、もう一度入力してください"
      render :new
    end
  end

private
  def idea_params
    params.require(:idea).permit(:body, :tag_list)
  end
end
