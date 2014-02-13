class UserBooksController < ApplicationController 
  before_action :authorize_user!
  before_action :set_list
  before_action :set_user
  before_action :set_user_book, only: [:destroy]

  # GET /user_books
  # GET /user_books.json
  def index
    @books = @list.books
  end

  # GET /user_books/1
  # GET /user_books/1.json
  def show
  end

  # GET /user_books/new
  def new
    @books = @list.books
  end

  # GET /user_books/1/edit
  def edit
  end

  # POST /user_books
  # POST /user_books.json
  def create
    if @list.update(user_book_params)
      redirect_to user_list_path(@list.user, @list)
    else
      render :new
    end
  end

  # PATCH/PUT /user_books/1
  # PATCH/PUT /user_books/1.json
  def update
    respond_to do |format|
      if @user_book.update(user_book_params)
        format.html { redirect_to @user_book, notice: 'User book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_books/1
  # DELETE /user_books/1.json
  def destroy
    @user_book.destroy
    respond_to do |format|
      format.html { redirect_to user_books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end
  
  def set_user_book
    @user_book = UserBook.find_by(list_id: params[:list_id], book_id: params[:id])
  end
  
  def set_user
    @user = @list.user
  end
  
  def set_books
    @list.books = Book.all
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_book_params
      params.require(:list).permit(book_ids:[])
    end
end
