module ApplicationHelper
  def helper_picture_url(event)
    if event.photos?
      cl_image_path(event.photos.first.path)
    else
      "http://www.ledarlington.com/wp-content/uploads/2015/02/happyhour.jpg"
    end
  end

  def helper_picture_tag(event)
    if event.photos?
      cl_image_tag(event.photos.first.path)
    else
      image_tag("image-cover.jpg")
    end
  end

  def helper_picture_tag(user)
    if user.photo?
      cl_image_tag(user.photo.path)
    else
      image_tag("lilian.jpg")
    end
  end
end
