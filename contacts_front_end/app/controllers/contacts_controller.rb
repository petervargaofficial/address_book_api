class ContactsController < ApplicationController
  before_action :load_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = current_user.contacts
  end

  def show
    @response = JSON.parse(Typhoeus.get('localhost:3000/show?format=json').body)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      redirect_to root_path
    else
      flash[:errors] = @contact.errors.full_messages
      render :new
    end
  end

  def edit
    
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact
    else
      flash[:errors] = @contact.errors.full_messages
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to root_path
  end

  def new_email
    # Should return a view that allows the user to create an email
    @contact = Contact.find_by_id(params[:id])
  end

  def send_email
    # Does the actual sending of the email by calling
    # the other rails server
    
    email_params = params.require(:email_info).permit(:email, :subject, :body)
    email_params[:user_id] = current_user.id
    EmailWorker.perform_async(email_params)
    redirect_to root_path
  end

  def sent_email
    # A response page that shows that the user's email got sent
  end

  private

  def load_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address, :photo)
  end
end
