class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy comments new_comment create_comment history_items update_status]

  # GET /properties or /properties.json
  def index
    @properties = Property.includes(:comments).order(:created_at).last(10)
  end

  # GET /properties/1 or /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.user = current_user

    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def comments
    @comments = @property.comments.order(created_at: :desc)
  end

  def new_comment
    @comment = @property.comments.new
  end

  def create_comment
    @property.comments.create(user: current_user, title: comments_params[:title], body: comments_params[:body])
    redirect_to get_property_comments_url(@property)
  end

  def history_items
    @history_items = @property.history_items.order(created_at: :desc)
  end

  def update_status
    @property.status_updates.create(user: current_user, status: status_params[:status].to_i)
    redirect_to get_property_history_items_url(@property), notice: "Property Status was successfully updated."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
    @current_status = @property.current_status
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:title, :address_line1, :address_line2, :city, :zip, :description, :picture_url, :status)
  end

  def comments_params
    params.permit(:title, :body)
  end

  def status_params
    params.permit(:status)
  end
end
