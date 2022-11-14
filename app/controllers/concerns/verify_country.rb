module VerifyCountry
  def verify_country
    if params[:country].nil? || !RestCountriesFacade.all_countries.include?(params[:country].capitalize)
      render json: ErrorSerializer.bad_country, status: 400
    end 
  end
end