module ApplicationHelper

  # Return the page title for a page
  def full_title(page_title = '')
    base_title = 'OSU Book Exchange'
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
