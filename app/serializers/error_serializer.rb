class ErrorSerializer 
  def self.parse_errors(errors)
    {
      errors: errors.full_messages.map do |error|
        {
        message: error
        }
      end
    }
  end

  def self.parse_error(error)
    {
      error: error.message
    }
  end

  def self.bad_country
    {
      error: "Country Not Found"
    }
  end

  def self.bad_email 
    {
      error: "Email Not Found"
    }
  end

  def self.bad_key
    {
      error: "Valid Api_key Required"
    }
  end
end