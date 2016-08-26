module EventsHelper

  def average_stars(average)
    "#{full_star(average)}#{empty_star(average)}".html_safe
  end

  def stars(rating)
    "#{full_star(rating)}#{empty_star(rating)}".html_safe
  end

  def full_star(rating)
    ('<i class="fa fa-star" aria-hidden="true"></i>' * rating).html_safe
  end

  def empty_star(rating)
    ('<i class="fa fa-star-o" aria-hidden="true"></i>' * (5 - rating)).html_safe
  end

end

