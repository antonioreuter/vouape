class VouapeController < ApplicationController

  respond_to :html, :json, :js

  
  def index
    puts 'Acessando INDEX'
    
    
    respond_to do |format|
      format.html    
      format.js
    end

  end

  def map
    puts 'Acessando PROMOTION_MAP'
    @promotions = Promotion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json {render :json => @promotions.all }
      format.xml {
        render :text => @promotions.to_xml(:root=>'data')
      }
    end
  end

  def find_promotions
    @location =  params[:localizacao]

    @page = "1"
    if params[:page]
      @page = params[:page]
    end
  
    begin

      @promotions = Promotion.origin(@location, :within => params[:distance]).page(@page).per(5)
      if (@promotions == nil || @promotions.size == 0)
        puts ">>>>>>>>>>>>>>>>>> Voce esta sem sorte. Nao temos promocoes na vizinhanca"
        flash[:notice] = "Voce esta sem sorte. Nao temos promocoes na vizinhanca"
      end      
    rescue Exception => e     
      @promotions = nil
      flash[:error] = "O endereco que voce informou nao existe, tente digitar novamente."
    end


    respond_to do |format|
      format.html {render :action => "index" }      
      format.js 
    end
  end

  def current_promotions
  
    respond_to do |format|
      format.html {render :partial => "/promotions/promotion", :collections => @promotions }
      format.json {render :json => @promotions.all }
      format.js
    end
  end



end
