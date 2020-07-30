class MedicinesController < ApplicationController
  before_action :set_prescription
  before_action :set_medicine, only: [:show, :edit, :update, :destroy]



  # GET /medicines/1
  # GET /medicines/1.json
  def show
  end

  # GET /medicines/new
  def new
    @medicine = Medicine.new
  end

  # GET /medicines/1/edit
  def edit
  end

  # POST /medicines
  # POST /medicines.json
  def create
    @medicine = @prescription.medicines.new(medicine_params)

    respond_to do |format|
      if @medicine.save
        format.html { redirect_to @prescription, notice: 'Medicine was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /medicines/1
  # PATCH/PUT /medicines/1.json
  def update
    respond_to do |format|
      if @medicine.update(medicine_params)
        format.html { redirect_to @prescription, notice: 'Medicine was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /medicines/1
  # DELETE /medicines/1.json
  def destroy
    @medicine.destroy
    respond_to do |format|
      format.html { redirect_to @prescription, notice: 'Medicine was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine
      @medicine = @prescription.medicines.find_by(id: params[:id])
    end

    def set_prescription
      @prescription = Prescription.find_by(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def medicine_params
      params.require(:medicine).permit(:name, :usage, :days, :dose, :effect, :side_effect, :prescription_id)
    end
end
