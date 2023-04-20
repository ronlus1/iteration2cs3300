class AddcustomersController < ApplicationController
  before_action :set_addcustomer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy]

  # GET /addcustomers or /addcustomers.json
  def index
    @addcustomers = Addcustomer.all
  end

  # GET /addcustomers/1 or /addcustomers/1.json
  def show
  end

  # GET /addcustomers/new
  def new
    @addcustomer = Addcustomer.new
  end

  # GET /addcustomers/1/edit
  def edit
  end

  # POST /addcustomers or /addcustomers.json
  def create
    @addcustomer = Addcustomer.new(addcustomer_params)

    respond_to do |format|
      if @addcustomer.save
        format.html { redirect_to addcustomer_url(@addcustomer), notice: "Addcustomer was successfully created." }
        format.json { render :show, status: :created, location: @addcustomer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @addcustomer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addcustomers/1 or /addcustomers/1.json
  def update
    respond_to do |format|
      if @addcustomer.update(addcustomer_params)
        format.html { redirect_to addcustomer_url(@addcustomer), notice: "Addcustomer was successfully updated." }
        format.json { render :show, status: :ok, location: @addcustomer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @addcustomer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addcustomers/1 or /addcustomers/1.json
  def destroy
    @addcustomer.destroy

    respond_to do |format|
      format.html { redirect_to addcustomers_url, notice: "Addcustomer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addcustomer
      @addcustomer = Addcustomer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def addcustomer_params
      params.require(:addcustomer).permit(:name, :lastname, :homeaddress, :dateofbirth)
    end
end
