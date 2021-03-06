class PrescriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_not_first_set
  before_action :set_prescription, only: %i[show edit update destroy]
  before_action :set_user, only: %i[show edit update destroy]

  # GET /prescriptions
  # GET /prescriptions.json
  def index
    @prescriptions = Prescription.all
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.json
  def show
    @medicines = @prescription.medicines
    @user_id = current_user.id

    @start_date = Date.today
    @start_date = params[:start_date].to_date if params[:start_date]

    @week = params[:week] if params[:week]
  end

  # GET /prescriptions/new
  def new
    @prescription = Prescription.new
  end

  # GET /prescriptions/1/edit
  def edit; end

  # POST /prescriptions
  # POST /prescriptions.json
  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.user_id = current_user.id
    respond_to do |format|
      if @prescription.save
        format.html { redirect_to @prescription, notice: '新規処方を作成いたしました。' }
        format.json { render :show, status: :created, location: @prescription }
      else
        format.html { render :new }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescriptions/1
  # PATCH/PUT /prescriptions/1.json
  def update
    respond_to do |format|
      if @prescription.update(prescription_params)
        format.html { redirect_to @prescription, notice: '過去処方を修正いたしました。' }
        format.json { render :show, status: :ok, location: @prescription }
      else
        format.html { render :edit }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.json
  def destroy
    @prescription.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: '過去処方を削除いたしました。' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prescription
    @prescription = Prescription.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def prescription_params
    params.require(:prescription).permit(:start_time, :visit_date, :hospital, :doctor, :pharmacy)
  end

  def set_user
    redirect_to root_path, notice: '権限がありません' if @prescription.user_id != current_user.id && current_user.admin == false
  end
end
