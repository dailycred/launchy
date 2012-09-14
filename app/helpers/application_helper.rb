module ApplicationHelper
  def connect_path(provider)
    url = "/auth/dailycred?identity_provider=#{provider.to_s}"
    url += "&referrer=#{current_url}"
  end

  def current_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end
end
