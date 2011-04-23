class UserPromotionsController < ApplicationController
  # GET /user_promotions
  # GET /user_promotions.xml
  def index
    @user_promotions = UserPromotion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_promotions }
    end
  end

  # GET /user_promotions/1
  # GET /user_promotions/1.xml
  def show
    @user_promotion = UserPromotion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_promotion }
    end
  end

  # GET /user_promotions/new
  # GET /user_promotions/new.xml
  def new
    @user_promotion = UserPromotion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_promotion }
    end
  end

  # GET /user_promotions/1/edit
  def edit
    @user_promotion = UserPromotion.find(params[:id])
  end

  # POST /user_promotions
  # POST /user_promotions.xml
  def create
    @user_promotion = UserPromotion.new(params[:user_promotion])

    respond_to do |format|
      if @user_promotion.save
        format.html { redirect_to(@user_promotion, :notice => 'User promotion was successfully created.') }
        format.xml  { render :xml => @user_promotion, :status => :created, :location => @user_promotion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_promotions/1
  # PUT /user_promotions/1.xml
  def update
    @user_promotion = UserPromotion.find(params[:id])

    respond_to do |format|
      if @user_promotion.update_attributes(params[:user_promotion])
        format.html { redirect_to(@user_promotion, :notice => 'User promotion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_promotion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_promotions/1
  # DELETE /user_promotions/1.xml
  def destroy
    @user_promotion = UserPromotion.find(params[:id])
    @user_promotion.destroy

    respond_to do |format|
      format.html { redirect_to(user_promotions_url) }
      format.xml  { head :ok }
    end
  end
end
