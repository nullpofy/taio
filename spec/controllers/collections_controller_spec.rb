require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CollectionsController do

  # This should return the minimal set of attributes required to create a valid
  # Collection. As you add validations to Collection, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {name:'name'}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CollectionsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all collections as @collections" do
      collection = Collection.create! valid_attributes
      get :index, {}, valid_session
      assigns(:collections).should eq(Collection.all)
    end
  end

  describe "GET show" do
    it "assigns the requested collection as @collection" do
      collection = Collection.create! valid_attributes
      get :show, {:id => collection.to_param}, valid_session
      assigns(:collection).should eq(collection)
    end
  end

  describe "GET new" do
    it "assigns a new collection as @collection" do
      get :new, {}, valid_session
      assigns(:collection).should be_a_new(Collection)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Collection" do
        expect {
          post :create, {:collection => valid_attributes}, valid_session
        }.to change(Collection, :count).by(1)
      end

      it "assigns a newly created collection as @collection" do
        post :create, {:collection => valid_attributes}, valid_session
        assigns(:collection).should be_a(Collection)
        assigns(:collection).should be_persisted
      end

      it "redirects to the created collection" do
        post :create, {:collection => valid_attributes}, valid_session
        response.should redirect_to(:collections)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved collection as @collection" do
        # Trigger the behavior that occurs when invalid params are submitted
        Collection.any_instance.stub(:save).and_return(false)
        post :create, {:collection => {}}, valid_session
        assigns(:collection).should be_a_new(Collection)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Collection.any_instance.stub(:save).and_return(false)
        post :create, {:collection => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested collection" do
      collection = Collection.create! valid_attributes
      expect {
        delete :destroy, {:id => collection.to_param}, valid_session
      }.to change(Collection, :count).by(-1)
    end

    it "redirects to the collections list" do
      collection = Collection.create! valid_attributes
      delete :destroy, {:id => collection.to_param}, valid_session
      response.should redirect_to(collections_url)
    end
  end

end
