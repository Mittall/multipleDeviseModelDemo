class Admins::AuthorsController < Admins::AdminsController

  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all

    #@author = Author.new
    #@res = @author.admin_role(current_admin.role_type)
  end

  def show
  end

  def new
    @author = Author.new
    @admin = @author.build_admin
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    respond_to do |format|
      if @author.save
        @author.admin_id = @author.admin.id
        @author.save
        format.html { redirect_to admins_authors_url, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to admins_authors_url, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin = Admin.find(@author.admin_id)
    @admin.destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to admins_authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:post, :admin_attributes => [:email, :password, :password_confirmation])
    end
end
