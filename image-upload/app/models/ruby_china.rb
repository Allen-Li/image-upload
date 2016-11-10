class RubyChina
  class << self
    def get_home_page(url=nil)
      get_html_by_url("https://ruby-china.org/#{url}")
    end

    def get_topic_page(id=nil)
      get_html_by_url("https://ruby-china.org/topics/#{id}")
    end

    def get_html_by_url url
      agent = Mechanize.new
      agent.ssl_version = :TLSv1
      agent.verify_mode = OpenSSL::SSL::VERIFY_NONE

      agent.get(url).body
    end

    def sign_in(url, password, login, remember_me=0)

      password = 'never'
      login = 'forever'

      agent = Mechanize.new
      agent.ssl_version = :TLSv1
      agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
      sign_in_page= 'https://ruby-china.org/account/sign_in'

      agent.get(sign_in_page) do |login_page|

        # ruby china
        form = login_page.forms[1]
        form.field_with(name: 'user[login]').value = login
        form.field_with(name: 'user[password]').value = password
        form.method = 'GET'

        form.submit
      end  

      agent.get(url).body
    end
  end
end