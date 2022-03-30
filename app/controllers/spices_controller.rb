class SpicesController < ApplicationController
    def create 
        newSpice = Spice.create(params.permit(:title, :image, :description, :notes, :rating))
        render json: newSpice, status: :created

    end

    def index
        spices = Spice.all 
        render json: spices  
    end 
   
    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
          spice.destroy
          head :no_content
        else
          render json: { error: "Spice not found" }, status: :not_found
        end
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
          spice.update(params.permit(:title, :image, :description, :rating, :notes))
          render json: spice
        else
          render json: { error: "Spice not found" }, status: :not_found
        end
      end


    # private
    # def find_spice 
    #     Spice.find_by(:id params[:id])
    # end
end
