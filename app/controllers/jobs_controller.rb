class ProposalsController < ApplicationController
  def create
    @job=Job.create(job_params)
  end
end
