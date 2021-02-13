class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:edit, :destroy, :vote]
  def index
   @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to '/'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @candidate = Candidate.update(candidate_params)
      redirect_to '/', notice: '編輯成功'
    else
      render :edit
    end
  end

  def destroy
    if @candidate.destroy
      redirect_to '/'
    end
  end

  def vote
    @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
    redirect_to '/', notice: '投票成功'
  end
  

  private
    def candidate_params
      params.require(:candidate).permit(:name, :age, :party)
    end

    def find_candidate
      @candidate = Candidate.find_by(id: params[:id])
    end    
end
