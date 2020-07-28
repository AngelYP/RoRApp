class DailiesController < ApplicationController

    before_action :set_daily, only: [:edit, :update, :destroy]

    def new
        @daily=Daily.new
    end

    def create
        @daily= Daily.new daily_params
        @daily.save
        redirect_to root_path
    end

    def showData
        @headers=["Día","Confirmados","Muertes","Sospechosos","Negativos","Acciones"]
        @totalCases=Daily.order(id: :desc).all
        @cases=@totalCases.take(5)
        @last10=Daily.find(Daily.last.id-10).positives

        @charts=[{},{}]
        @totalCases.each_with_index do |ccase, index|
            if index<@totalCases.length-2 
                @charts[0][ccase.created_at.to_date]=ccase.positives-@totalCases[index+1].positives
                @charts[1][ccase.created_at.to_date]=ccase.deaths-@totalCases[index+1].deaths
            end
        end
        
    end

    def edit
    end

    def update
        @daily.update daily_params
        redirect_to root_path
    end

    def destroy
        @daily.destroy
        redirect_to root_path
    end

    private

    def daily_params
        params.require(:daily).permit(:positives, :negatives, :deaths, :suspects)
    end

    def set_daily
        @daily=Daily.find params[:id]
    end

end
