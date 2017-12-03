class FactTagsController < ApplicationController
  before_action :set_fact_tag, only: [:show, :edit, :update, :destroy]

    before_action :admin_user, only: [:destroy, :new, :edit, :create, :update, :index, :show]

  # GET /fact_tags
  # GET /fact_tags.json
  def index
    @fact_tags = FactTag.all
  end

  # GET /fact_tags/1
  # GET /fact_tags/1.json
  def show
  end

  # GET /fact_tags/new
  def new
    @fact_tag = FactTag.new
  end

  # GET /fact_tags/1/edit
  def edit
  end

  # POST /fact_tags
  # POST /fact_tags.json
  def create
    @fact_tag = FactTag.new(fact_tag_params)

    respond_to do |format|
      if @fact_tag.save
        format.html { redirect_to @fact_tag, notice: 'Fact tag was successfully created.' }
        format.json { render :show, status: :created, location: @fact_tag }
      else
        format.html { render :new }
        format.json { render json: @fact_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fact_tags/1
  # PATCH/PUT /fact_tags/1.json
  def update
    respond_to do |format|
      if @fact_tag.update(fact_tag_params)
        format.html { redirect_to @fact_tag, notice: 'Fact tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @fact_tag }
      else
        format.html { render :edit }
        format.json { render json: @fact_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fact_tags/1
  # DELETE /fact_tags/1.json
  def destroy
    @fact_tag.destroy
    respond_to do |format|
      format.html { redirect_to fact_tags_url, notice: 'Fact tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def admin_user
      redirect_to(root_url) unless User.find_by(id: session[:user_id]) && User.find_by(id: session[:user_id]).admin?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_fact_tag
      @fact_tag = FactTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fact_tag_params
      params.require(:fact_tag).permit(:fact_id, :tag_id)
    end
end
