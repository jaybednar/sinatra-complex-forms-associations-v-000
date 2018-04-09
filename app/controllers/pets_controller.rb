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
      @owner = Owner.create(params[:owner])
      @pet.owner = @owner
    end
    @pet.save

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get 'pets/:id/edit'
    @pet = Pet.find(params[:id])
    erb '/pets/edit'

  post '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.owner = Owner.find(params[:pet][:owner_id])
    if params[:owner][:name]
      @pet.owner = Owner.create(name: params[:owner][:name])
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end
end
