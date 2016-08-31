class SittersController < ApplicationController
  layout 'application'
  #profile creation for sitter
  def create
    @sitter=Sitter.create(sitter_params)
    if @sitter
      session[:sitter_id]=@sitter.id
      @preference=params[:preference]
      puts @sitter.id, "This is the @sitter.id"

      new_sitter=Sitter.last
      puts new_sitter, 'this is new sitter'
      puts @preference, 'this is @pref'
      @preference.each do |ani|
        Prefence.create(sitter_id: new_sitter.id, animal_id: ani.to_i)
      end
      redirect_to "/sitters/#{@sitter.id}"
    else
      flash[:errors]=@sitter.errors.full_messages
      redirect_to "/"
    end
  end
  #sitter dashboard to view/accept proposals
  def show
    @sitter=Sitter.find(session[:sitter_id])
    @proposals=Proposal.all
  end

  def edit
    @sitter=Sitter.find(session[:sitter_id])
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
   redirect_to "/crittersitter"
 end

  private
    def sitter_params
      params.require(:sitter).permit(:first_name, :last_name, :password, :password_confirmation, :email, :phone, :zip, :state, :address, :city, :start_date, :end_date)
    end
end
