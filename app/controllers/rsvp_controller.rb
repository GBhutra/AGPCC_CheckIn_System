class RsvpController < ApplicationController
  def new
    @event = Event.find_by_id(params[:id])
    if !@event || @event.start_time < DateTime.now 
      redirect_to root_path
    end
  end
  
  def new_with_new_member
    @email_id = session[:email]
    @first_name = session[:first_name] 
    @last_name = session[:last_name]
    @event = Event.find_by_id(params[:id])
    if !@event || @event.start_time < DateTime.now
      redirect_to root_path
    end
  end

  def create
    @event = Event.find_by_id(params[:id])
    if !valid_email?(params[:member][:email])
      flash[:danger] = "Email error please enter valid details!"
      redirect_to :action => 'new', :id => @event.id
      return
    end
    @member = Member.find_by_email(params[:member][:email])
    session[:email] = params[:member][:email] if params[:member][:email]
    if (@member)
      @rsvp = Rsvp.new(event_id: @event.id, member_id: @member.id)
      if @rsvp.save
        flash[:success] = "Thank you for RSVPing!"
        redirect_to root_path
      else
        flash[:danger] = @rsvp.errors[:member_id]
        redirect_to :action => 'new', :id => @event.id
      end
    else
      redirect_to :action => 'new_with_new_member', :id => @event.id
    end
  end
  
  def create_with_new_member
    @event = Event.find_by_id(params[:id])
    @member = Member.new(member_params)
    session[:first_name] = @member.first_name
    session[:last_name] = @member.last_name
    if @member.save
      @rsvp = Rsvp.new(event_id: @event.id, member_id: @member.id)
      if @rsvp.save
        flash[:success] = "Thank you for RSVPing!"
        redirect_to root_path
      else
        flash[:danger] = @rsvp.errors.messages
      end
    else
      flash[:warning] = @member.errors.full_messages.to_sentence
      redirect_to action: "new_with_new_member", id: @event.id
    end
  end
  
  private
  
  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :gender, :classification)
  end
  
  def valid_email?(email)
    email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  end
  
end
