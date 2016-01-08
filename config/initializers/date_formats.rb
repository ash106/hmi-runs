Date::DATE_FORMATS[:shorthand] = "%m/%d/%Y"
Date::DATE_FORMATS[:short_year] = "%m/%d/%y"
Date::DATE_FORMATS[:month_names] = lambda { |date| date.strftime("%b #{date.day.ordinalize}, %Y") }
