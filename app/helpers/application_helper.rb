module ApplicationHelper
  def helper_picture_url(event)
    if event.photos?
      cl_image_path(event.photos.path)
    else
      "http://psquareweddings.com/wp-content/uploads/2014/10/Event-management-post-1.png"
    end
  end
end
