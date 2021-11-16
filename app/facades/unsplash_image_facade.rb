class UnsplashImageFacade
  class << self
    def find_photo(location)
      data = UnsplashImageService.image_data(location)
      result = data[:results].first
      BackgroundImage.new(result)
    end
  end
end
