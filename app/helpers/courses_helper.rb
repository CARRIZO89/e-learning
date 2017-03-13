module CoursesHelper
  def image_url(url)

    url.slice(0..(url.index('?')-'?'.length))

  end
end
