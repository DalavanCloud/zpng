module ZPNG
  class Pixels
    include Enumerable

    def initialize image
      @image = image
    end

    def each
      @image.height.times do |y|
        @image.width.times do |x|
          yield @image[x,y]
        end
      end
    end
  end
end
