class SearchresController < ApplicationController
  # GET /searchres
  # GET /searchres.json
  def index
    @searchres = Searchre.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searchres }
    end
  end

  # GET /searchres/1
  # GET /searchres/1.json
  def show
    @searchre = Searchre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @searchre }
    end
  end

  # GET /searchres/new
  # GET /searchres/new.json
  def new
    @searchre = Searchre.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @searchre }
    end
  end

  # GET /searchres/1/edit
  def edit
    @searchre = Searchre.find(params[:id])
  end

  # POST /searchres
  # POST /searchres.json
  def create
    @searchre = Searchre.new(params[:searchre])

    respond_to do |format|
      if @searchre.save
        format.html { redirect_to @searchre, notice: 'Searchre was successfully created.' }
        format.json { render json: @searchre, status: :created, location: @searchre }
      else
        format.html { render action: "new" }
        format.json { render json: @searchre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /searchres/1
  # PUT /searchres/1.json
  def update
    @searchre = Searchre.find(params[:id])

    respond_to do |format|
      if @searchre.update_attributes(params[:searchre])
        format.html { redirect_to @searchre, notice: 'Searchre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @searchre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searchres/1
  # DELETE /searchres/1.json
  def destroy
    @searchre = Searchre.find(params[:id])
    @searchre.destroy

    respond_to do |format|
      format.html { redirect_to searchres_url }
      format.json { head :no_content }
    end
  end
end
