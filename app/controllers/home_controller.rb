class HomeController < ApplicationController
  require 'mailgun'

  def index

  end
  
  def write
     
    @address = params[:address]
    @title = params[:title]
    @content = params[:content]
    
    #Mailgun 부분
    
    mg_client = Mailgun::Client.new("key-ea69232f621a0b8af48ce39a956d9eab")
    
    message_params =  {
                       from: 'unamed122@gmail.com',
                       to: @address,
                       subject: @title,
                       text: @content
                      }
    
    result = mg_client.send_message('sandbox82f3aba31c514f78917ca32cff6be383.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
    
    #DB 부분
    
    new_post = Post.new
    new_post.address = @address
    new_post.title = @title
    new_post.content = @content
    
    new_post.save
    
    redirect_to '/list'
  end
  
  def list
    
    @every_post = Post.all.order("id desc")
    
  end
end
class HomeController < ApplicationController
  require 'mailgun'

  def index

  end
  
  def write
     
    @address = params[:address]
    @title = params[:title]
    @content = params[:content]
    
    #Mailgun 부분
    
    mg_client = Mailgun::Client.new("key-ea69232f621a0b8af48ce39a956d9eab")
    
    message_params =  {
                       from: 'unamed122@gmail.com',
                       to: @address,
                       subject: @title,
                       text: @content
                      }
    
    result = mg_client.send_message('sandbox82f3aba31c514f78917ca32cff6be383.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
    
    #DB 부분
    
    new_post = Post.new
    new_post.address = @address
    new_post.title = @title
    new_post.content = @content
    
    new_post.save
    
    redirect_to '/list'
  end
  
  def list
    
    @every_post = Post.all.order("id desc")
    
  end
end
