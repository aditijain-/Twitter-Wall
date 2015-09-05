class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    @commentsArray ||= Array.new
    @comments.each do |comment|
        if comment.filtered == true
           @commentsArray.push("<h3><b>#{comment.name}</b></h3><p style=\"margin-top: 5px; color:black\">#{comment.comment}</p>".html_safe)
        end
      end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @tweet = Tweet.find(params[:id])
    if @tweet.present?
      @tweet.update_attribute(:filtered, "true")
    end
    flash[:success] = "Tweet was successfully approved."
    redirect_to moderator_url
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = "Comment was successfully submitted for approval."
      redirect_to '/comments'
    else
      flash[:error] = "There was an error creating your comment."
      redirect_to '/comments/new'
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attribute(:filtered, "true")
      flash[:success] = "Comment were successfully approved."
      redirect_to moderator_url
    else
      flash[:error] = "There was an error approving the comment."
      redirect_to moderator_url
    end
  end

  def destroy_all
    if Comment.all.count >= 1 && Comment.delete_all(:filtered => true)
      flash[:success] = "All comments were successfully deleted."
      redirect_to moderator_url
    else
      flash[:error] = "There was an error deleting all comments."
      redirect_to moderator_url
    end
  end

  def deleteAllUnapproved
    if Comment.where(:filtered => false).count >= 1 && Comment.destroy_all(:filtered => false)
      flash[:success] = "All unapproved comments were successfully deleted."
      redirect_to moderator_url
    else
      flash[:error] = "There was an error deleting all unapproved comments."
      redirect_to moderator_url
    end
  end

  def approveAll
    if Comment.where(:filtered => false).count >= 1 && Comment.update_all( :filtered => true )
      flash[:success] = "All comments were successfully approved."
      redirect_to moderator_url
    else
      flash[:error] = "There was an error approving all comments."
      redirect_to moderator_url
    end
  end

  # DELETE /comments/1
  def destroy
    if @comment.destroy
      flash[:success] = "Comment was successfully deleted."
      redirect_to moderator_url
    else
      flash[:error] = "There was an error deleting the comment."
      redirect_to moderator_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :comment, :filtered)
    end
end
