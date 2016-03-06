ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html = %(<div class="ui input error">#{html_tag}</div>).html_safe
end