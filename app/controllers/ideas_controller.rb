class IdeasController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    @ideas = if params[:tag]
               Idea.tagged_with(params[:tag])
             else
               Idea.all
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
        format.html { redirect_to root_path }
        format.json { render :index, status: :created, message: 'Created' }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity, message: 'Unprocessable Entity' }
      end
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:body, :tag_list)
  end
end
