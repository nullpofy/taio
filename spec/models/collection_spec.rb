require 'spec_helper'

describe Collection do
  describe "csv_rows=" do
    it "generates Contents" do
      collection = Collection.new name:'name', csv_rows:[['key0', 'val0'], ['key1', 'val1'], ['key2', 'val2']]
      collection.save
      collection.reload
      collection.contents.count.should be(3)
    end
  end

  describe "validates" do
    it "validates presence of name" do
      collection = Collection.new
      collection.valid?.should be_false
      collection.errors.should include(:name)
    end

    it "validates uniqueness of name" do
      collection = Collection.new name:'name'
      collection.valid?.should be_true
      collection.save
      collection = Collection.new name:'name'
      collection.valid?.should be_false
      collection.errors.should include(:name)
    end
  end
end
