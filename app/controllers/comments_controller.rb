class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :require_login
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /comments or /comments.json
  def index
    redirect_to root_path
  end

  # GET /comments/1 or /comments/1.json
  def show
    redirect_to root_path
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @match = Match.find(params[:match_id])
    @current_user = session['userinfo']
  end

  # GET /comments/1/edit
  def edit
    @match = Match.find(params[:match_id])
    @current_user = session['userinfo']
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @match = Match.find(@comment.match_id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to match_url(@match), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @match = Match.find(@comment.match_id)

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to match_url(@match), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @match = Match.find(@comment.match_id)
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to match_url(@match), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:text, :match_id, :username)
    end

    # Only let signed in users to add comments
    def require_login
      current_user = session['userinfo']
      unless current_user.present?
        flash[:error] = "Must be logged in to add new comments."
        redirect_to root_path
      end
    end

    # Only admins and the author of the comment can edit it and delete it 
    def correct_user
      current_user = session['userinfo']
      comment = Comment.find(params[:id])
      unless comment.username == current_user["nickname"] || current_user["name"] == "velara8158@cadolls.com"
        flash[:error] = "Unauthorized access."
        redirect_to root_path
      end
    end
end
