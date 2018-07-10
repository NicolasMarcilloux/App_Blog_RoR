class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def load_user
		@user = User.find params[:id]
	end

  def index
		@users = User.all.order('first_name ASC')
	end

	def show
    puts "show"

	end

	def edit
    puts "edit"
	end

	def update
		if @user.update_attributes user_params
			redirect_to @user
		else
			render 'edit'
		end
	end

	def new

	end

	def destroy
    puts "destroy"
		@user.destroy
		if @user.save
			redirect_to @user
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	private

    def user_params
    # Définit les attributs autorisés et les prend en compte
      params.require(:user).permit(
		:first_name,
		:last_name,
		:email
		)
    end
end
