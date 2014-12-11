module UsersHelper

  # Returns the Gravatar for the given user
  # Gravatar images are found by MD5 hash of email address(lowercase)
  def gravatar_for(user)
    gravatar_id = !user.email.nil? ? Digest::MD5::hexdigest(user.email.downcase) :
      Digest::MD5::hexdigest("example@nowhere.com")
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
  
end
  
