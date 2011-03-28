class FramesController < ApplicationController
  # GET /frames
  # GET /frames.xml

  def index
    #raise "indexing"
    @frames = Frame.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @frames }
    end
  end

  # GET /frames/1
  # GET /frames/1.xml
  def show
    @frame = Frame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @frame }
    end
  end

  # GET /frames/new
  # GET /frames/new.xml
  #def new
  #  @frame = Frame.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.xml  { render :xml => @frame }
  #  end
  #end

  # GET /frames/1/edit
  def edit
    @session = Session.find(params[:session_id])
    @turn = params[:turn]
    @player = @session.player
    @frame = Frame.find_by_session_id_and_turn(@session.id, @turn) || Frame.new(:session_id => @session.id, :turn => @turn)
  end

  alias_method :new, :edit
  # POST /frames
  # POST /frames.xml
  #def create
  #  #raise params.inspect
  #  @frame = Frame.new(params[:frame])
  #
  #  respond_to do |format|
  #    if @frame.save
  #      flash[:notice] = 'Frame was successfully created.'
  #      format.html { redirect_to(@session.game) }
  #      format.xml  { render :xml => @frame, :status => :created, :location => @frame }
  #    else
  #      format.html { render :action => "new" }
  #      format.xml  { render :xml => @frame.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /frames/1
  # PUT /frames/1.xml
  def update
    @session = Session.find(params[:frame][:session_id])
    @turn = params[:frame][:turn]
    @frame = Frame.find_by_session_id_and_turn(@session.id, @turn) || Frame.new(:session_id => @session.id, :turn => @turn)

    respond_to do |format|
      if @frame.update_attributes(params[:frame])
        flash[:notice] = 'Frame was successfully updated.'
        format.html { redirect_to(@session.game) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit"}
        format.xml  { render :xml => @frame.errors, :status => :unprocessable_entity }
      end
    end
  end

  alias_method :create, :update
  # DELETE /frames/1
  # DELETE /frames/1.xml
  def destroy
    @frame = Frame.find(params[:id])
    @frame.destroy

    respond_to do |format|
      format.html { redirect_to(frames_url) }
      format.xml  { head :ok }
    end
  end
end
