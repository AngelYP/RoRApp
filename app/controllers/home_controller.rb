class HomeController < ApplicationController

    def insertData

    end


    def showData
        @headers=["Día","Confirmados","Muertes","Sospechosos","Negativos"]
        @cases=Daily.order(id: :desc).take(5)
        @last10=Daily.find(Daily.last.id-10).positives
    end

end
