class DataController < ApplicationController
  skip_before_filter :authorize, :only => [:index, :show, :new, :create]
  # GET /data
  # GET /data.xml
  def index
    @data = Datum.all
    @time = Time.now.strftime("%H:%M %m-%d-%y ")
    
    @data.each do |data|
      data.gmaps = true
      data.update_attributes(:gmaps)
    end
    
    @json = Datum.all.to_gmaps4rails
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data }
    end
  end

  # GET /data/1
  # GET /data/1.xml
  def show
    @datum = Datum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @datum }
    end
  end

  # GET /data/new
  # GET /data/new.xml
  def new
    @datum = Datum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @datum }
    end
  end

  # GET /data/1/edit
  def edit
    @datum = Datum.find(params[:id])
  end

  # POST /data
  # POST /data.xml
  def create
    @datum = Datum.new(params[:datum])
    
    if(params[:datum])
      @datum = Datum.new(params[:datum])
    else
      params[:datum] = {:latitude => params[:latitude],
                        :longitude => params[:longitude],
                        :gmaps => params[:gmaps],
                        :location => params[:location],
                        :address => params[:address],
                        :carrier => params[:carrier],
                        :wifi => params[:wifi],
                        :cell => params[:cell]
      }
      @datum = Datum.new(params[:datum])
    end
      
    respond_to do |format|
      if @datum.save
        format.html { redirect_to(@datum, :notice => 'Datum was successfully created.') }
        format.xml  { render :xml => @datum, :status => :created, :location => @datum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /data/1
  # PUT /data/1.xml
  def update
    @datum = Datum.find(params[:id])
    
    if(!params[:datum])
      params[:datum] = {:latitude => params[:latitude],
                        :longitude => params[:longitude],
                        :gmaps => params[:gmaps],
                        :location => params[:location],
                        :address => params[:address],
                        :carrier => params[:carrier],
                        :wifi => params[:wifi],
                        :cell => params[:cell]
      }
    end
    
    
    respond_to do |format|
      if @datum.update_attributes(params[:datum])
        format.html { redirect_to(@datum, :notice => 'Datum was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data/1
  # DELETE /data/1.xml
  def destroy
    @datum = Datum.find(params[:id])
    @datum.destroy

    respond_to do |format|
      format.html { redirect_to(data_url) }
      format.xml  { head :ok }
    end
  end
end
