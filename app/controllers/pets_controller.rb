class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    # binding.pry
    @pet = Pet.create(params[:pet])
    if params[:pet][:owner_id]
      @pet.owner = Owner.find(params[:pet][:owner_id])
    elsif params[:owner][:name]
      @pet.owner = Owner.create(params[:owner])
    end
    @pet.save

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
      @pet.owner = Owner.create(params[:owner])
    #   @pet.owner = Owner.find(params[:pet][:owner_id])
    # elsif !!params[:owner][:name]
    #   @pet.owner = Owner.create(params[:owner])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end
end
