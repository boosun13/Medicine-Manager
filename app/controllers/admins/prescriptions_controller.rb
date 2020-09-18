class Admins::PrescriptionsController < ApplicationController
  before_action :if_not_admin
  before_action :set_admin
  before_action :set_prescription, only: %i[show edit update destroy]

  # GET /prescriptions
  # GET /prescriptions.json
  def index
    @prescriptions = Prescription.all
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.json
  def show
    @medicines = @prescription.medicines
  end

  # GET /prescriptions/new
  def new
    @prescription = Prescription.new
    @user = User.find_by(id: params[:admin_id])
  end

  # GET /prescriptions/1/edit
  def edit; end

  # POST /prescriptions
  # POST /prescriptions.json
  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.user_id = params[:admin_id]
    if @prescription.save
      redirect_to admin_path(params[:admin_id]), notice: 'Prescription was successfully created.'
    else
      @admin = User.find_by(id: params[:admin_id])
      render new_admins_prescription_path
    end
  end

  # PATCH/PUT /prescriptions/1
  # PATCH/PUT /prescriptions/1.json
  def update
    if @prescription.update(prescription_params)
      redirect_to admin_path(params[:admin_id]), notice: 'Prescription was successfully updated.'
    else
      @admin = User.find_by(id: params[:admin_id])
      render :edit
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.json
  def destroy
    @prescription.destroy
    redirect_to admin_path(params[:admin_id]), notice: 'Prescription was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prescription
    @prescription = Prescription.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def prescription_params
    params.require(:prescription).permit(:start_time, :visit_date, :hospital, :doctor, :pharmacy)
  end

  def if_not_admin
    redirect_to root_path, notice: '権限がありません' unless current_user.admin?
  end

  def set_admin
    @admin = User.find_by(id: params[:admin_id])
  end
end
