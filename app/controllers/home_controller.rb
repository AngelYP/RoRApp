class HomeController < ApplicationController

    def insertData

    end


    def showData
        @cases=Daily.all
    end

end
