module UsersHelper
  # Returns the gravatar for the given user
  def gravatar_for user, options={size: 50}
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}?size=#{size}"
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end
end
