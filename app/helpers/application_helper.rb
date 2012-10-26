module ApplicationHelper
  def connect_path(provider)
    url = "/auth/dailycred?identity_provider=#{provider.to_s}"
    url += "&referrer=#{current_url}"
  end

  def current_url
    host = if request.host == "127.0.0.1" then "localhost" else request.host end
    "#{request.protocol}#{host}:#{request.port}#{request.fullpath}"
  end

  def tweet_url opts={}
    opts[:url] ||= current_url
    url = "http://twitter.com/share"
    make_url url, opts
  end

  def facebook_url opts={}
    opts[:u] ||= current_url
    make_url "http://facebook.com/sharer/sharer.php", opts
  end

  def gplus_url opts={}
    opts[:url] ||= current_url
    make_url "https://plus.google.com/share", opts
  end

  private

  def make_url url, opts={}
    url += "?"
    params = []
    opts.each do |k,v|
      params.push "#{k}=#{u(v)}"
    end
    url += params.join("&")
  end

end
