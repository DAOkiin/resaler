module PagesHelper
  def home_page_partial_path
    if user_signed_in?
      'layouts/home/searches_list'
    else
      'layouts/home/need_login'
    end
  end
end
