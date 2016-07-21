module ApplicationHelper

   def get_pre_selected_option(property)
    (params[:search] && params[:search]["#{property}"] && params[:search]["#{property}"] != "") ? params[:search]["#{property}"].to_i : nil
  end
  
  def ethnicity_options
    options_for_select([
      ['Choose Ethnicity...', nil],
      ['White', 0],
      ['Black/ African/Caribbean/Black British', 1],
      ['Asian/Asian British', 2],
      ['Mixed/Multiple ethnic groups', 3],
      ['Other ethnic group', 4],
      ], get_pre_selected_option("ethnicity"))
  end

  def industries
    industries = ["agriculture", "civil_service", "construction", "defense", "education", "energy", "health", "industrial", "technology" ]
  end

end
