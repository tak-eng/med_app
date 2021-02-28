class IdeasController < ApplicationController
  def index
    @idea = Idea.pluck(:id,:body)
    # @idea = Idea.includes(:tags).all.order('created_at DESC')
    @tags = ActsAsTaggableOn::Tag.all
    if params[:tag]
      @idea = Idea.tagged_with(params[:tag]).pluck(:id,:body)
      
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
      if @idea.valid?
        @idea.save
        format.json { render :index, status: 201 }
        format.html { redirect_to root_path, message: "Created" }
      else
        format.json { render json: @idea.errors, status: 422, message: "Unprocessable Entity" }
        format.html { render :new }
      end
    end
  end

private
  def idea_params
    params.require(:idea).permit(:body, :tag_list)
  end
end
