class ContactsController < ApplicationController

  def index
    @store = Store.find(params[:store_id])
    @contacts = Contact.where(store_id: @store.id).order("created_at DESC")
    @contact = Contact.new
  end

  def create
    contact = Contact.new(contact_params)
    if contact.valid?
      contact.save
      redirect_to action: :index
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact.user_id == current_user.id
      contact.destroy
    end
    redirect_to action: :index
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :text).merge(user_id: current_user.id, store_id: params[:store_id])
  end
end
