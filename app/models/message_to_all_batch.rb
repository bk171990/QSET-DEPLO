class MessageToAllBatch < ActiveRecord::Base
  belongs_to :batch
  belongs_to :course
  after_save :send_bulk_message
  

  def send_bulk_message
  	require "rubygems"
    require "net/https"
    require "uri"
    require "json"
    uname = "janardan.v.kamble@gmail.com"
    hash = "f8a218add2ed839f1a4caae1624219786b9f33985cdba868d592a66d3a64d493"
    message = MessageToAllBatch.find_by(batch_id: batch_id.to_i)
    message_batch = message.batch.students
    message = message.body
    message_batch.each do |s|
    numbers = s.phone1.to_s
    sender = "TXTLCL" 
    requested_url = 'http://api.textlocal.in/send/?' + "username=" + uname + "&hash=" + hash + "&numbers=" + numbers + "&message=" + body + "&sender=" + sender
    uri = URI.parse(requested_url)
    http = Net::HTTP.start(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(request)
    response = JSON.parse(res.body)
    puts (response)
   end
  end
end
