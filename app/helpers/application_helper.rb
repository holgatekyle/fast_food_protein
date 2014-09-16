module ApplicationHelper
  def is_active?(link_path)
    current_page?(link_path) ? "active" : ""
  end
  
  def full_title(page_title)
    base_title = "Fast Food Protein"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
end
