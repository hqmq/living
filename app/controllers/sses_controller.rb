class SsesController < ApplicationController
  include ActionController::Live
  before_action :set_ss, only: [:show, :edit, :update, :destroy]

  # GET /sses
  # GET /sses.json
  def index
    last_event_id = 0
    key = params[:key]
    response.headers['Content-Type'] = 'text/event-stream'
    begin
      loop do
        response.stream.write("event: ping\n\n")
        sleep 3
      end
      
    rescue IOError
      puts "ioerror:: #{$!}"
    ensure
      response.stream.close
    end
  end

  # GET /sses/1
  # GET /sses/1.json
  def show
  end

  # GET /sses/new
  def new
    @ss = Sse.new
  end

  # GET /sses/1/edit
  def edit
  end

  # POST /sses
  # POST /sses.json
  def create
    @ss = Sse.new(ss_params)

    respond_to do |format|
      if @ss.save
        format.html { redirect_to @ss, notice: 'Sse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ss }
      else
        format.html { render action: 'new' }
        format.json { render json: @ss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sses/1
  # PATCH/PUT /sses/1.json
  def update
    respond_to do |format|
      if @ss.update(ss_params)
        format.html { redirect_to @ss, notice: 'Sse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sses/1
  # DELETE /sses/1.json
  def destroy
    @ss.destroy
    respond_to do |format|
      format.html { redirect_to sses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ss
      @ss = Sse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ss_params
      params.require(:ss).permit(:key, :data)
    end
end
