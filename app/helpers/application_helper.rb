module ApplicationHelper
  def helper_picture_url(event)
    if event.photos?
      cl_image_path(event.photos.path)
    else
      "http://twindolphinpools.com/wp-content/uploads/2014/06/Ducky3.jpg"
    end
  end
end
