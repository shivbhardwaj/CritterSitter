class ProposalsController < ApplicationController
  def create
  	@owner = Owner.find(session[:id])
    proposalcreate=Proposal.new(proposal_params)
    if proposalcreate.valid?
      proposalcreate.save
      newproposal= Proposal.last
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
