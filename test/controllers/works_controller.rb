require 'test_helper'

describe WorksController do
  describe "index" do
    it "lists all the books" do
#must_be is a method with two arguments the symbolized version of what you're
#doing and whatever you expect the value to be
    Work.count.must_be :>, 0
    get books_path
    must_respond_with :success
  end
  end
  it "still responds successfully when there are no books" do
    Work.destroy_all
    get works_path
    must_respond_with :success
  end
  describe "new" do
    #you can probably get away with one test "if i send a new request do I get a new item"

  end

  describe "create" do
    it "adds a book to the database" do
      work_data = {
        work: {
          title: "test book",
          created_by: "keith sweat",
          published: "1998",
         }
       }
      post works_path, params: work_data
      must_redirect_to  :works_path
    end

    it "re-renders the new book form if the  book is invalid" do
    work_data = {work:{title: "test work"} }
      post works_path, params: work_data
      must_respond_with :bad_request
    end
  end

  describe "show" do
    it "retrieves books that exist" do
      work = Work.first
      get works_path(work)
      must_respond_with :success
    end

    it "returns 404 not found if the book id doesn't exist" do
      #you can set the id randomly but you can also get the last one
      # book_id = 1337
      work_id = Work.last.id
      work_id += 1
      get work_path(work_id)

      must_respond_with :not_found
    end
  end

end