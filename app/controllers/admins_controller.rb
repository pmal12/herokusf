class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.order(:username)
  end


  def show
  end

  def new
    @admin = Admin.new
  end

  def edit
  end


  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_url, notice: 'Admin #{@admin.username} was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admins_url, notice: 'Admin #{@admin.username} was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
   begin
      @admin.destroy
      flash[:notice] = "Admin #{@admin.username} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end
    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:username, :password, :password_confirmation)
    end
end
