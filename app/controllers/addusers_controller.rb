class AddusersController < ApplicationController
  before_action :set_adduser, only: %i[ show edit update destroy ]

  # GET /addusers or /addusers.json
  def index
    @addusers = Adduser.all
  end

  # GET /addusers/1 or /addusers/1.json
  def show
  end

  # GET /addusers/new
  def new
    @adduser = Adduser.new
  end

  # GET /addusers/1/edit
  def edit
  end

  # POST /addusers or /addusers.json
  def create
    @adduser = Adduser.new(adduser_params)

    respond_to do |format|
      if @adduser.save
        format.html { redirect_to adduser_url(@adduser), notice: "Adduser was successfully created." }
        format.json { render :show, status: :created, location: @adduser }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adduser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addusers/1 or /addusers/1.json
  def update
    respond_to do |format|
      if @adduser.update(adduser_params)
        format.html { redirect_to adduser_url(@adduser), notice: "Adduser was successfully updated." }
        format.json { render :show, status: :ok, location: @adduser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adduser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addusers/1 or /addusers/1.json
  def destroy
    @adduser.destroy

    respond_to do |format|
      format.html { redirect_to addusers_url, notice: "Adduser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adduser
      @adduser = Adduser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adduser_params
      params.require(:adduser).permit(:name, :lastname, :homeaddress, :dateofbirth)
    end
end
