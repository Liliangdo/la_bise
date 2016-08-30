module ApplicationHelper
  def helper_picture_url(event)
    if event.photos?
      cl_image_path(event.photos.first.path)
    else
      "http://static.wixstatic.com/media/b6a999_c97c7e56d74149a9aed270cc83927158.jpg"
    end
  end

  def helper_picture_tag(event)
    if event.photos?
      cl_image_tag(event.photos.first.path)
    else
      image_tag("image-cover.jpg")
    end
  end

  def helper_user_picture_tag(user)
    if user.photo?
      cl_image_tag(user.photo.path)
    else
      image_tag("lilian.jpg")
    end
  end
end
