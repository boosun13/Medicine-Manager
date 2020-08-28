class CheckersController < ApplicationController

    def create
        @checker = Checker.new
        @checker.medicine_id = params[:medicine_id].to_i
        @checker.timing = params[:timing].to_i
        @checker.check_date = params[:check_date]

        if @checker.save
            @week = params[:medicine_id]
            @prescription = Prescription.find(params[:prescription_id])
            @checked = params[:check_date]
        else
            @week = params[:medicine_id]
        end
        
        
    end

    def destroy
        @checker = Checker.find_by(id: params[:id])

        @prescription = Prescription.find(params[:prescription_id])
        @checked = @checker.check_date.to_date
        @week = @checker.medicine_id


        @checker.destroy

    end

end
