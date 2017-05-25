class Correspondence < ActiveRecord::Base

  validates_presence_of :email
  validates_presence_of :name
  validates_format_of :email, :with => Authlogic::Regex.email
  validates_presence_of :team

  belongs_to :restaurant

  after_create :create_token


  #automatically creates a randomized token to be used as an identifier
  def create_token
    token = SecureRandom.urlsafe_base64.to_s
    cor = Correspondence.find_by_token(token)
    if cor
      self.create_token
    else
      self.token = token
      self.save!
    end
  end



  #Validates the JSON input
  def input_valid?(input)
    begin
      data = JSON.parse(input)
    rescue JSON::ParserError => e
      nil
    end

    if e.nil? # this is valid JSON
      returnme = true
      # begin
      puts "----"
      puts data["restaurant"]["logo"].present?
      puts "----"
        if data["members"] and data["members"].class == Array and data["members"].size > 0 and data["restaurant"] and data["restaurant"].class == Hash and data["restaurant"]["logo"] and data["restaurant"]["name"] and data["restaurant"]["yelp_link"]
          data["members"].each do |member|
            if !(member.class == Hash and member.has_key?("email") and member.has_key?("name") and member.has_key?("team"))
              returnme = nil
            end
          end
        else
          returnme = nil
        end
      if returnme
        data
      else
        nil
      end
    else
      nil
    end
  end


end
