class GeneratorController < ApplicationController
    def index
        @planers = Planer.all
       
    end
end
