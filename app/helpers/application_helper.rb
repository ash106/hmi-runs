module ApplicationHelper
  def extract_date(date)
    Date.strptime(date, '%m/%d/%Y') if !date.blank?
  end
end
