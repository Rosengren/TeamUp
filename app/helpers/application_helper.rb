module ApplicationHelper

  def flash_style(flash_level)
    case flash_level
      when "success" then "ui success message"
      when "error" then "ui negative message"
      when "danger" then "ui negative message"
      when "notice" then "ui info message"
      when "warning" then "ui warning message"
    end
  end
end
