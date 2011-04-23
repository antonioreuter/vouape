#encoding: UTF-8
class PromotionsController < ApplicationController
  # GET /promotions
  # GET /promotions.xml
  def index
    @client_id = params[:client_id]
    @promotions = Promotion.find_all_by_client_id @client_id

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @promotions }
    end
  end

  # GET /promotions/1
  # GET /promotions/1.xml
  def show
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>> VAI MOSTRAR UMA PROMOCAO JA CADASTRADA...'
    
    @promotion = Promotion.find(params[:id])
    @client = @promotion.client
    @client_id = @client.id

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @promotion }
    end
  end

  # GET /promotions/new
  # GET /promotions/new.xml
  def new
    puts '>>>>>>>>>>>>>>> VAI CADASTRAR NOVA PROMOCAO...'

    @client_id = params[:client_id]
    @client = Client.find(@client_id)

    @promotion = Promotion.new
    @promotion.client_id = @client_id

    respond_to do |format|
      format.html    
    end
  end

  # GET /promotions/1/edit
  def edit    
    @promotion = Promotion.find(params[:id])
    @client = @promotion.client
    @client_id = @client.id
  end

  # POST /promotions
  # POST /promotions.xml
  def create
    @client_id = params[:client_id]
    @promotion = Promotion.new(params[:promotion])

    @promotion.start_date = Date.today
    @promotion.finish_date = Date.today + 10

    # @promotion.define_coordinates(@promotion)

    respond_to do |format|
      if @promotion.save
        
        format.html { redirect_to(promotion_path(:client_id => @client_id), :notice => 'Promotion was successfully created.') }
        format.xml  { render :xml => @promotion, :status => :created, :location => @promotion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /promotions/1
  # PUT /promotions/1.xml
  def update

    puts '>>>>>>>>>> ATUALIZANDO A PROMOCAO....'

    @client_id = params[:client_id]
    @promotion = Promotion.find(params[:id])

    @promotion.start_date = Date.today
    @promotion.finish_date = Date.today + 10

    

    respond_to do |format|
      if @promotion.update_attributes(params[:promotion])
        format.html { redirect_to(promotion_path(:client_id => @client_id), :notice => 'Promotion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.xml
  def destroy    
    @promotion = Promotion.find(params[:id])
    @client_id = @promotion.client.id
    @promotion.destroy

    respond_to do |format|
      format.html { redirect_to(promotions_url(:client_id => @client_id)) }
      format.xml  { head :ok }
    end
  end
end
