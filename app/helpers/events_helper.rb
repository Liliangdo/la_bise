module EventsHelper
  def total_reviews(event)
    if event.reviews.count == 0
      "no review yet"
    elsif event.reviews.count == 1
      "1 review"
    else
     "#{event.reviews.count} reviews"
    end
  end
end
