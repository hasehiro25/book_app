# frozen_string_literal: true

class Book::CommentsController < ::CommentsController
  def create
    @commentable = find_book
    super
  end

  private
    def find_book
      Book.find(params[:book_id])
    end
end
