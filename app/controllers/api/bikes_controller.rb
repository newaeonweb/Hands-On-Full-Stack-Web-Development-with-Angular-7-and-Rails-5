module Api
    class BikesController < ApplicationController
        # List Bikes
        def index
            bikes = Bike.all();
            json_response(bikes, 200)
            # render json: {status: 'SUCCESS', message:'Loaded successfuly', data:bikes}, status: :ok
        end

        # Show Bike by id
        def show
            bike = Bike.find(params[:id]);
            render json: {status: 'SUCCESS', message:'Loaded bike', data:bike}, status: :ok
        end

        # Create Bike
        def create
            bike = Bike.new(bike_params)
            if bike.save
                render json: {status: 'SUCCESS', message:'Bike saved', data:bike}, status: :ok
            else
                json_response(bike.errors, 422)
                # render json: {status: 'ERROR', message:'Bike not saved', data:bike.erros}, status: :unprocessable_entity
            end
        end

        # Atualizar um artigo
        def update
            bike = Bike.find(params[:id])
            if bike.update_attributes(bike_params)
                render json: {status: 'SUCCESS', message:'Bike Updated', data:bike}, status: :ok
            else
                render json: {status: 'ERROR', message:'Bike not update', data:bike.erros}, status: :unprocessable_entity
            end
        end

        # Delete Bike
        def destroy
            bike = Bike.find(params[:id])
            bike.destroy
            render json: {status: 'SUCCESS', message:'Deleted bike', data:bike}, status: :ok
        end

        # Private Bike params
        private
        def bike_params
            params.permit(:make, :model, :year, :items)
        end
    end
end