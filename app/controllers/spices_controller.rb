class SpicesController < ApplicationController
    wrap_parameters format: []
    # get all spice
    def index
        spice = Spice.all
        render json: spice
    end
    # get by id
    # def show
    #     spice =Spice.find_by(id: params[:id])
    #     render json: spice
    # end
    # create a new spice
    def create
        spice= Spice.create( spice_params)
        render json: spice, status: :created
    end
# update an existing spice
def update
    spice =Spice.find_by(id: params[:id])
    if spice
        spice.update(spice_params)
        render json: spice
    else
        render json: { error: " spice not found" }, status: :not_found
    end
end
#  delete an exiting spice 
def destroy
    spice =Spice.find_by(id: params[:id]) 
    if spice
        spice.destroy
        head :no_content
        else
            render json: { error: " spice not found" }, status: :not_found
        end

end
    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
