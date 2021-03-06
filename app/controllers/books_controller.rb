# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :verify_posted_user, only: [:edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.page params[:page]
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @comments = @book.comments.includes(:user)
    @comment = @book.comments.build
  end

  # GET /books/new
  def new
    @book = current_user.books.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to @book, notice: t(".success")
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if @book.update(book_params)
      redirect_to @book, notice: t(".update")
    else
      render :edit
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    redirect_to books_url, notice: t(".destroy")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def verify_posted_user
      # 403ページ未作成
      head :forbidden unless @book.user == current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :memo, :author, :picture)
    end
end
