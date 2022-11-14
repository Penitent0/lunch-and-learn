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
end