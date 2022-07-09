class AnimatedGif < ApplicationRecord
  belongs_to :user

  def generate
    frames = 10
    gif = Magick::ImageList.new
    
    frames.times do |i|
      image = Magick::Image.new(width, height).color_fill_to_border(1, 1, random_color)
      annotate_word(image: image,word: 'NFTPLGAMS')
      image.delay = 30
      gif << image
    end
  
    gif.to_blob { self.format = 'gif' }    
  end


  def annotate_word(image:, word:)
    c = word.chars
    draw = Magick::Draw.new
    draw.gravity = Magick::CenterGravity

    draw.font_family = self.font
    draw.pointsize = self.fontsize
    draw.font_weight = Magick::BoldWeight
    draw.font_style = Magick::NormalStyle
    draw.fill = random_color

    image.annotate(draw, 0, 0, 0, -130, c.first(3).join(" "))
    image.annotate(draw, 0, 0, 0, 0, c[3..5].join(" ")) 
    image.annotate(draw, 0, 0, 0, 130, c[6..8].join(" ")) {
      #self.fill=colour
    }

    # footer
    draw.gravity = Magick::SouthGravity
    image.annotate(draw, 0, 0, 0, 20, "www.nftplayground.amsterdam") {
      self.pointsize = 10
    }

  end

  def random_color
    colour = "#"
    3.times {
      colour << "%02X" % (rand * 256)
    }
    colour
  end

  def text_color
    @text_color ||= random_color
  end

  def width
    960
  end

  def height
    540
  end

  def fontsize
    128
  end

  def padding
    10
  end

  def font
    'Roboto Mono'
  end

end
