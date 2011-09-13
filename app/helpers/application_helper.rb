module ApplicationHelper
  def gravatar_url_for(email)
    url_for({
      :gravatar_id => Digest::MD5.hexdigest(email),
      :host        => 'www.gravatar.com',
      :protocol    => 'http://',
      :only_path   => false,
      :controller  => 'avatar.php'
    })
  end
end
