class CheckInController < ApplicationController
  
  def new
    @event = Event.find_by_id(params[:id])
    if !@event || (@event.start_time > DateTime.now || @event.end_time < DateTime.now)
      redirect_to root_path
    end
  end
  
  def new_with_new_member
    @email_id = session[:email]
    @first_name = session[:first_name] 
    @last_name = session[:last_name]
    @event = Event.find_by_id(params[:id])
    if !@event || (@event.start_time > DateTime.now || @event.end_time < DateTime.now)
      redirect_to root_path
    end
  end

  def index
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

    #@SID : Get users lat long from cookies via geolocation, check location.js
    @users_lat_lng = cookies[:lat_lng]
    @event_lat_lng = Array[@event.latitude,@event.longitude]

    if admin_user_signed_in?
    else
      if @users_lat_lng.nil?
        flash[:danger] = "Failed. Location Services Are Not Available"
        redirect_to root_path
        return
      end
      
      if @users_lat_lng.include?('ERR')
        flash[:danger] = @users_lat_lng
        redirect_to root_path
        return
      end  
        
      @users_lat_lng = cookies[:lat_lng].split("|")
      #@SID : Calculate User's distance from event
      distance_from_event = distance(@users_lat_lng, @event_lat_lng)
      
      if(distance_from_event > 100.0)
        flash[:danger] = "Failed! You need to be present in the event to check in"
        redirect_to root_path
        return
      end
    end
    
    if (@member)
      @check_in = CheckIn.new(event_id: @event.id, member_id: @member.id)
      if @check_in.save
        @member.paid_status ? @member.points+=1 : @member.points
        @member.save
        flash[:success] = "Check in Successful. Thank You!"
        redirect_to root_path
      else
        flash[:danger] = @check_in.errors[:member_id]
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
      @check_in = CheckIn.new(event_id: @event.id, member_id: @member.id)
      if @check_in.save
        flash[:success] = "Check in Successful. Thank you!"
        redirect_to root_path
      else
        flash[:success] = @check_in.errors.messages
      end
    else
      flash[:warning] = @member.errors.full_messages.to_sentence
      redirect_to action: "new_with_new_member", id: @event.id
    end
  end
  
  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :gender, :classification)
  end
  
  private
  
  def distance loc1, loc2
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters
  
    loc1[0] = loc1[0].to_f
    loc1[1] = loc1[1].to_f
    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
 end
 
  def valid_email?(email)
    email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  end
  
end
