class SittersController < ApplicationController
  layout 'application'

  def log
    sitter = Sitter.find_by_email(params[:email])
    if sitter
      session[:sitter_id] = sitter.id
      redirect_to "/sitters/#{session[:sitter_id]}"
    else
      flash[:errors] = ["Invalid login"]
      redirect_to :back
    end
  end

  def logout
    session[:sitter_id] = nil
    redirect_to "/"
  end

  def create
    sitter = Sitter.new(sitter_params)
    if sitter.valid?
      sitter.save
      session[:sitter_id]=sitter.id
      preference=params[:preference]
      new_sitter=Sitter.last
      preference.each do |ani|
        Prefence.create(sitter_id: new_sitter.id, animal_id: ani.to_i)
      end
      redirect_to "/sitters/#{sitter.id}"
    else
      flash[:errors]=sitter.errors.full_messages
      redirect_to "/"
    end
  end
  #   @sitter=Sitter.create(sitter_params)
  #   puts "ths is at sitter", @sitter.first_name
  #   if @sitter
  #     session[:sitter_id]=@sitter.id
  #     @preference=params[:preference]
  #     @new_sitter=Sitter.last
  #     @preference.each do |ani|
  #       Prefence.create(sitter_id: @new_sitter.id, animal_id: ani.to_i)
  #     end
  #     redirect_to "/sitters/#{@sitter.id}"
  #   else
  #     flash[:errors]=@sitter.errors.full_messages
  #     redirect_to "/"
  #   end
  # end
  #sitter dashboard to view/accept proposals
  def show
    @sitter=Sitter.find(session[:sitter_id])
    @proposals=Proposal.all
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
      params.require(:sitter).permit(:first_name, :last_name, :password, :password_confirmation, :email, :phone, :zip, :state, :address, :city, :start_date, :end_date)
    end
end
