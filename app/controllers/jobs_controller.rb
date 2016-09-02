class JobsController < ApplicationController
  def create
    job=Job.create(job_params)
    watch=Watch.where(:watchable_id=>params[:proposal_id], :watchable_type=>'newproposal')
    watch.each do |w|
    	w.update(:watchable_id=>job.id, :watchable_type=>'newjob')
    end
    Proposal.find(params[:proposal_id]).destroy
    redirect_to :back
  end
  private
  def job_params
  	params.require(:job).permit(:start_date, :end_date, :owner_id, :sitter_id, :sitter_rating, :owner_rating)
  end
end
