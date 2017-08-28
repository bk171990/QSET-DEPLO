class MessageToAllDepartment < ActiveRecord::Base
  belongs_to :employee_department
  after_save :send_bulk_message
  

  def send_bulk_message
  	require "rubygems"
    require "net/https"
    require "uri"
    require "json"
    uname = "janardan.v.kamble@gmail.com"
    hash = "f8a218add2ed839f1a4caae1624219786b9f33985cdba868d592a66d3a64d493"
    binding.pry
    message = MessageToAllDepartment.find_by(employee_department_id: employee_department_id.to_i)
    message_dept = message.employee_department.employees
    message = message.body
    message_dept.each do |s|
    numbers = s.mobile_phone.to_s
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
