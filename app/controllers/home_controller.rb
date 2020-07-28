class HomeController < ApplicationController

    def insertData

    end


    def showData
        @headers=["Día","Confirmados","Muertes","Sospechosos","Negativos"]
        @totalCases=Daily.order(id: :desc).all
        @cases=@totalCases.take(5)
        @last10=Daily.find(Daily.last.id-10).positives

        @charts=[{},{}]
        @totalCases.each_with_index do |ccase, index|
            if index<@totalCases.length-2 
                @charts[0][ccase.id]=ccase.positives-@totalCases[index+1].positives
                @charts[1][ccase.id]=ccase.deaths-@totalCases[index+1].deaths
            end
        end
        @test=Daily.select(:positives).group(:id).take(10)
        
    end

end
