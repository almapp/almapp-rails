class UCAccountValidator < AccountValidator
  require 'nokogiri'
  require 'open-uri'

  LOGIN_PATH = 'https://sso.uc.cl/cas/login'
  LOGOUT_PATH = 'https://sso.uc.cl/cas/logout'

  def validate_user(user, password)
    uri = URI.parse(LOGIN_PATH)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    lt = UCAccountValidator.lt_token(response.body)
    cookie = UCAccountValidator.session_cookie(response)

    data = "username=#{user.username}&password=#{password}&lt=#{lt}&execution=e1s1&_eventId=submit"
    headers = {
      'Cookie' => cookie,
      'Content-Type' => 'application/x-www-form-urlencoded'
    }

    response = http.post(LOGIN_PATH, data, headers)
    response_cookies = response.response['set-cookie']
    success = response_cookies.present? && response_cookies.size > 0

    if success
      headers = {
        'Cookie' => response_cookies,
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
      response = http.get(LOGOUT_PATH, headers)
    else

    end
  end

  def self.lt_token(html)
    doc = Nokogiri::HTML(html)
    doc.at('input[@name="lt"]')['value']
  end

  def self.session_cookie(response)
    response.response['set-cookie'].split('; ')[0]
  end

end