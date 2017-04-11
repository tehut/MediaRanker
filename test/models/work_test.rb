require "test_helper"
describe Work do
  let(:work) {Work.new }

  describe "validations" do
    it "can be created with all attributes" do
      a = Work.create!(title: "kissed by a rose", category: "album", created_by: "SEAL", description: "best love song of the 90s", published: "london")
      result = a.valid?
      result.must_equal true
      end

      it "requires a title" do
        a = Work.new(category: "album", created_by: "seal")
        result = a.valid?
        result.must_equal false
      end

      it "requires a unique title" do
        a = Work.create!(title: "kissed by a rose", category: "album", created_by: "SEAL", description: "best love song of the 90s", published: "london")
        b = Work.new(title: "kissed by a rose", category: "album", created_by: "seal")
        result = b.valid?
        result.must_equal false
      end

      it "requires an author" do
        a = Work.new(category: "album")
        result = a.valid?
        result.must_equal false
      end

      it "does not require a unique author" do
        a = Work.create!(title: "rose kisses", category: "album", created_by: "SEAL", description: "best love song of the 90s", published: "london")
        b = Work.new(title: "kissed by a rose", category: "album", created_by: "seal")
        result = b.valid?
        result.must_equal true
      end

    end


  describe "testing relations" do

it "can count how many votes it has" do
  #this is where that test would go
end

it "can find a user's name through their vote" do
  #this is where that test would go
end


  end


end