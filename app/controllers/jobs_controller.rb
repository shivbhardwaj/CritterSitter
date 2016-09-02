class JobsController < ApplicationController
  def create
    job=Job.create(job_params)
    # #twiliooooooooooooooooo
    account_sid="AC2ee7c1f679be05f26f9c89866ff35fa1"
    auth_token=ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new account_sid, auth_token
    from = "+14087054722"

    client.account.messages.create(
      :from => from, 
      :to => job.sitter.phone, 
      :body => "Hey, #{job.sitter.first_name}, you just scored a new gig through SitterCritter.com!"
    )
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
