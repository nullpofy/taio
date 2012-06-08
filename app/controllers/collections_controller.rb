
class CollectionsController < ApplicationController
  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collections }
    end
  end

  # GET /collections/1.json
  def show
    @collection = Collection.find(params[:id])

    respond_to do |format|
      format.json { render json: @collection }
      format.elon
    end
  end

  # GET /collections/new
  # GET /collections/new.json
  def new
    @collection = Collection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collection }
    end
  end

  # POST /collections
  # POST /collections.json
  def create
    if params[:collection][:csv_text_input] or params[:collection][:csv_file_input]
      if params[:collection][:csv_text_input]
        rows = CSV.parse(params[:collection].delete(:csv_text_input))
      else
        rows = CSV.parse(params[:collection].delete(:csv_file_input).read.toutf8)
      end
      if params[:collection].delete(:skip_head) == '0'
        params[:collection][:csv_rows] = rows
      else
        params[:collection][:csv_rows] = rows[1 .. -1]
      end
    end

    @collection = Collection.new(params[:collection])

    respond_to do |format|
      if @collection.save
        format.html { redirect_to :collections, notice: 'Collection was successfully created.' }
        format.json { render json: @collection, status: :created, location: @collection }
      else
        format.html { render action: "new" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to collections_url }
      format.json { head :no_content }
    end
  end
end
