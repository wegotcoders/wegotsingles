module ApplicationHelper

  def get_pre_selected_option(property)
    (params[:search] && params[:search]["#{property}"] && params[:search]["#{property}"] != "") ? params[:search]["#{property}"].to_i : nil
  end

  def display_attribute(_method, value)
    _method.select{ |attribute| attribute[1] == value }[0][0] unless value.nil?
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

  def religious_beliefs
    [
      ["Choose religious belief...", nil],
      ["Buddhism", 0],
      ["Buddhism/Mahayana", 1],
      ["Buddhism/Mahayana/Zen", 2],
      ["Buddhism/Theravada", 3],
      ["Buddhism/Vajrayana", 4],
      ["Christianity", 5],
      ["Christianity/Catholic", 6],
      ["Christianity/Orthodox", 7],
      ["Christianity/Orthodox/Greek", 8],
      ["Christianity/Orthodox/Russian", 9],
      ["Christianity/Protestant", 10],
      ["Christianity/Protestant/Anglican", 11],
      ["Christianity/Protestant/Baptist", 12],
      ["Christianity/Protestant/Evangelical", 13],
      ["Christianity/Protestant/Mormon", 14],
      ["Christianity/Protestant/Penticostal", 15],
      ["Hinduism", 16],
      ["Hinduism/Shaivism", 17],
      ["Hinduism/Shaktism", 18],
      ["Hinduism/Smartism", 19],
      ["Hinduism/Vaishnavism", 20],
      ["Islam", 21],
      ["Islam/Baha'is", 22],
      ["Islam/Shi`ite", 23],
      ["Islam/Sufi", 24],
      ["Islam/Sunni", 25],
      ["Jainism", 26],
      ["Jainism/Digambara", 27],
      ["Jainism/Svetambara", 28],
      ["Judaism", 29],
      ["Judaism/Conservative", 30],
      ["Judaism/Orthodox", 31],
      ["Judaism/Reform", 32],
      ["No religion", 33],
      ["No religion/Agnostic", 34],
      ["No religion/Atheist", 35],
      ["No religion/Deist", 36],
      ["Paganism", 37],
      ["Paganism/Wiccan", 38],
      ["Rastafari", 39],
      ["Satanism", 40],
      ["Sikhism", 41],
      ["Scientology", 42],
      ["Zoroastrianism", 43],
      ["Other", 44]
    ]
  end

  def education_options
    options_for_select([
      ['Choose Highest Education Attained...', nil],
      ['PhD', 0],
      ['Masters MSc/MBA', 1],
      ['BSc/Undergraduate Degree', 2],
      ['A Levels', 3],
      ['HND/HNC/NVQ', 4],
      ['GCSE', 5],
      ['Other', 6]
      ], get_pre_selected_option("education"))
  end

end
