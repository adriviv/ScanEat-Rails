# 1) ========================================

require 'httparty' # Something in the Gem File ??? Add one

class UsercodeLookup

puts "yolo1"
  def initialize(usercode)
    puts "yolo"
    @usercode = usercode

  end



  def get_user_code
    response = HTTParty.get("https://api.weixin.qq.com/sns/jscode2session")
puts "merde"
# 2) ========================================
    #response.parsed_response <----- I read that on stackoverflow, should I add it ????
    body = JSON.parse(response.body)
puts "merde2"
    {
      encryptedData: body["encryptedData"],
      iv: body["iv"]
    }
  end





end
