class TwilioController < ApplicationController
  layout "invite_user_layout"
 #Inviting user for registration(twilio)
 def new_invite_user
  #render :layout => false
  puts "========new_invite_user==========="
  #@invited_user = User.new
 end

 def invite_user
  #render :layout => false
  puts "============invite_user==========="
  #@invited_user = User.find(:user => [params][:user][:first_name], params[:user][:mobile_number], params[:group_id])
  @first_name = params[:first_name]
  @mobile_number = params[:mobile_number]
  @group = Group.find(params[:group_id])
  @registration_code= @group.registration_code
  self.send_invitation

  redirect_to invite_new_user_path , :notice =>"Invitation send successfully."
 end

 
 #setting up twilio client

  def twilio_client
    Twilio::REST::Client.new('AC5616cdf701fdd599c7628dcfeb38d455',
      'e00a4484a7decab08f1538feec1fe2fe')
  end

  def send_invitation
    twilio_client.messages.create(
      to: @mobile_number,
      from: '+1 215-274-0881',
      body: "Welcome #{@first_name}. Please register here:  http://decnutapp.herokuapp.com and use code #{@registration_code}."
    )
  end
end