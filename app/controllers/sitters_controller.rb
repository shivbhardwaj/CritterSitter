class SittersController < ApplicationController
  layout 'application'

  def log
    sitter = Sitter.find_by(params[:email])
    if sitter
      session[:sitter_id] = sitter.id
      redirect_to "/sitters/#{session[:sitter_id]}"
    else
      flash[:errors] = ["Invalid login"]
      redirect_to :back
    end
  end

  def create
    sitter = Sitter.new(sitter_params)
    if sitter.valid?
      sitter.save
      session[:sitter_id]=sitter.id
      preference=params[:preference]
      preference.each do |ani|
        Prefence.create(sitter_id: new_sitter.id, animal_id: ani.to_i)
      end
      redirect_to "/sitters/#{sitter.id}"
    else
      flash[:errors]=sitter.errors.full_messages
      redirect_to "/"
    end
  end

  def logout
    session[:sitter_id] = nil
    redirect_to "/"
  end

  def show
    @sitter=Sitter.find(session[:sitter_id])
    @zip_sitter=@sitter.zip.to_i
    @allproposal = Proposal.last
    @zip_proposal=@allproposal.zip
    @distance=Geocoder::Calculations.distance_between(Geocoder.coordinates(Proposal.last.zip.to_i), Geocoder.coordinates(@zip_sitter.to_i))
    # @test=Geocoder::Calculations.distance_between([37.5695845,-122.3926229], [37.3770335,-121.9124743])
    # @proposals=Proposal.where(@distance==1)
    @proposals=Proposal.all
    # puts 'this is the proposal zipcode to lat/lon', Geocoder.coordinates(Proposal.zip.to_i)
    # puts 'this is the sitter zip to lat/long', Geocoder.coordinates(@sitter.zip.to_i)
    #@proposals=Proposal.where(Geocoder::Calculations.distance_between(Geocoder.coordinates(@zip_propsal.to_i), Geocoder.coordinates(@zip_sitter.to_i)))
  end

  def edit
    @sitter=Sitter.find(session[:sitter_id])
    @animals = Animal.all
  end

  def update
   @sitter=Sitter.find(session[:sitter_id])
   @sitter.update(sitter_params)
   #User.update(params[:id], name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
   redirect_to "/sitters/#{@sitter.id}"
 end

 def destroy
   Sitter.find(session[:sitter_id]).destroy
   session.clear
   redirect_to "/"
 end


  private
    def sitter_params
      params.require(:sitter).permit(:first_name, :last_name, :password, :password_confirmation, :email, :phone, :zip, :state, :address, :city, :preference, :start_date, :end_date)
    end
end
