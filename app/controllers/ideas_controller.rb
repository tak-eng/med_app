class IdeasController < ApplicationController
  def index
    @idea = Idea.includes(:tags).all.order('created_at DESC')
    @tags = ActsAsTaggableOn::Tag.all
    if params[:tag]
      @idea = Idea.tagged_with(params[:tag])
    else
      @ideas = Idea.all
    end
  end

  def new
    @idea = Idea.new
    @tags = ActsAsTaggableOn::Tag.all
  end

  def create
    @idea = Idea.new(idea_params)
    # if @idea.save
    #   response_created(:idea, :create)
    #   redirect_to root_path
    # else    
    #   response_unprocessable_entity(:idea)
    #   render :new
    # end
  
    if @idea.valid?
      @idea.save
      redirect_to root_path
    else    
      @idea = Idea.new
      render :new
    end
  end

private
  def idea_params
    params.require(:idea).permit(:body, :tag_list)
  end
end
