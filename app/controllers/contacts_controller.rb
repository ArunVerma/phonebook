class ContactsController < ApplicationController

	def set_breadcrumbs
    super
    add_breadcrumb 'Contact Management', '/'
  end

  def index
    @contacts = Contact.all
    add_breadcrumb 'Contact List', '#'
  end

  def new
    @contact = Contact.new
    @phone_number = @contact.phone_numbers.build
    @address = @contact.addresses.build
    add_breadcrumb 'Add New Contact', '#'
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Contact Saved Successfully"
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def edit
  	@contact = Contact.find(params[:id])
  	add_breadcrumb 'Edit Contact', '#'
  end

  def update
  	@contact = Contact.find(params[:id])
  	if @contact.update_attributes(contact_params)
      flash[:notice] = "Contact Updated Successfully"
      redirect_to contacts_path()
    else
      render 'edit'
    end
  end

  def show
  	@contact = Contact.includes(:phone_numbers, :addresses).find(params[:id])
  	add_breadcrumb "#{@contact.name}'s Details", '#'
  end

  def destroy
  	@contact = Contact.find(params[:id])
  	if @contact.destroy
  		flash[:notice] = "Contact Deleted Successfully"
  	else
  		flash[:error] = "Can't Delete Contact"
  	end
  	redirect_to contacts_path()
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email,
      addresses_attributes: [:id, :contact_id, :house_no, :street, :city, :state, :country, :address_type, :_destroy],
      phone_numbers_attributes: [:id, :contact_id, :phone_number, :_destroy])
  end
end
