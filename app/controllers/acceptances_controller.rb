class AcceptancesController < ApplicationController
  def create
  	@proposals=Proposal.all
  	Acceptance.create(sitter_id: session[:sitter_id], proposal_id: params[:proposal_id])
  	redirect_to :back
  end
end
