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
      if @medicine.save
        @status = true
        @medicines = @prescription.medicines
      else
        @status = false
      end
  end

  # PATCH/PUT /medicines/1
  # PATCH/PUT /medicines/1.json
  def update
    if @medicine.update(medicine_params)
      @status = true
      @medicines = @prescription.medicines
    else
      @status = false
    end
  end

  # DELETE /medicines/1
  # DELETE /medicines/1.json
  def destroy
    @medicine.destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine
      @medicine = @prescription.medicines.find_by(id: params[:id])
    end

    def set_prescription
      @prescription = current_user.prescriptions.find_by(id: params[:prescription_id])
    end
    
    def medicine_params
      params.require(:medicine).permit(:name, :usage, :days, :dose, :effect, :side_effect, :prescription_id)
    end
end
