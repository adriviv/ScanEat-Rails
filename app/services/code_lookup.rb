require 'httparty'

class CodeLookup

  def initialize(code)
    @code = code
  end

  def get_code_infos
    app_id = "wxf5724cd6172e7016"
    app_secret = "1ff5f6f43e3d40cdba75d27bd0e5e5b2"
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{app_id}&secret=#{app_secret}&js_code=#{@code}&grant_type=authorization_code"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end

end
