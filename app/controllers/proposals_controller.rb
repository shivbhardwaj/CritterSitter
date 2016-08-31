class ProposalsController < ApplicationController
  def create
  	@owner = Owner.find(session[:id])
 	Proposal.create(proposal_params)
 	newproposal = Proposal.last
 	params[:petid].each do |p|
 		Watch.create(pet_id: p.to_i, watchable_id: newproposal.id, watchable_type: "newproposal")
 	end
 	redirect_to :back
  end

  private
  def proposal_params
  	params.require(:proposal).permit(:name, :start_date, :end_date, :zip, :owner_id, :pet_id)
  end

end
