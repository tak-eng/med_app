class IdeasController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    if params[:tag]
      @ideas = Idea.tagged_with(params[:tag])
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
    respond_to do |format|
      if @idea.save
        format.json { render :index, status: :created, message: 'Created' }
        format.html { redirect_to root_path}
      else
        format.json { render json: @idea.errors, status: :unprocessable_entity, message: 'Unprocessable Entity' }
        format.html { render :new }
      end
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:body, :tag_list)
  end
end
