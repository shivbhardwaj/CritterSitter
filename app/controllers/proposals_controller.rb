class ProposalsController < ApplicationController
  def create
  	@owner = Owner.find(session[:id])
    proposalcreate=Proposal.new(proposal_params)
    if proposalcreate.valid?
      proposalcreate.save
      flash[:success] = ["Proposal has been created & sent out!"]
      newproposal= Proposal.last

      # # #twiliooooooooooooooooo
      # account_sid="AC2ee7c1f679be05f26f9c89866ff35fa1"
      # auth_token=ENV["TWILIO_AUTH_TOKEN"]
      # client = Twilio::REST::Client.new account_sid, auth_token
      # from = "+14087054722"

      # @send_sitters={}
      # @sitters=Sitter.all
      # @sitters.each do |s|
      #   @check_dist=Geocoder::Calculations.distance_between(Geocoder.coordinates(newproposal.zip.to_i), Geocoder.coordinates(s.zip.to_i))
      #   if (@check_dist<25)
      #     @send_sitters[s.phone]=s.first_name         
      #   end
      #   @send_sitters.each do |key, value|
      #     client.account.messages.create(
      #       :from => from, 
      #       :to => key, 
      #       :body => "Hey, #{value}, check out the newest opportunity on SitterCritter.com!"
      #     )
      #   end
      # end
      # #end twilioooooo
 	    params[:petid].each do |p|
 		     Watch.create(pet_id: p.to_i, watchable_id: newproposal.id, watchable_type: "newproposal")
 	    end
 	  redirect_to :back
    else
      flash[:errors]=["Invalid Entries"]
      redirect_to :back
    end
  end

  private
  def proposal_params
  	params.require(:proposal).permit(:name, :start_date, :end_date, :zip, :owner_id, :pet_id, :newproposal)
  end
end
