class AnimatedBlock < ApplicationRecord
  belongs_to    :animated_gif
  before_save   :upcase_block_word

  validates     :block_word, length: {minimum: 9, maximum: 9}
  validate      :valid_style
  
  def first_block_line
    block_word.chars.first(3).join(" ")
  end

  def second_block_line
    block_word.chars[3..5].join(" ")
  end

  def third_block_line
    block_word.chars[6..8].join(" ")
  end


  def style
    @style ||= BlockStyle.new(block_style) 
  end

  def style=(style)
    self[:block_style] = style.name
    style
  end

  private
  
    def valid_style
      errors.add(:role, "select valid style") unless style.valid?
    end

    def upcase_block_word
      self.block_word = block_word.upcase
    end

end


class BlockStyle

  Template = Struct.new(:name, :bg_color, :text_color)

  GIF0  = Template.new('random'                                   ) 
  GIF1  = Template.new('green_yellow'     , '#7dd856' , '#e7e76a' ) 
  GIF2  = Template.new('green_white'      , '#7dd856' , '#FFF'    ) 
  GIF3  = Template.new('green_darkgreen'  , '#7dd856' , '#375b43' ) 
  GIF4  = Template.new('yellow_green'     , '#e7e76a' , '#7dd856' ) 
  GIF5  = Template.new('yellow_white'     , '#e7e76a' , '#fff'    ) 
  GIF6  = Template.new('yellowdarkgreen' , '#e7e76a' , '#375b43' ) 
  GIF7  = Template.new('darkgreenyellow' , '#375b43' , '#e7e76a' ) 
  GIF8  = Template.new('darkgreen_white' , '#375b43' , '#FFFFFF' ) 
  GIF9  = Template.new('darkgreen_green' , '#375b43' , '#7dd856' ) 

  TEMPLATES = [GIF0, GIF1, GIF2, GIF3, GIF4, GIF5, GIF6, GIF7, GIF8, GIF9]

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def bg_color
    template.bg_color || random_color
  end

  def text_color
    template.text_color || random_color
  end

  def self.default
    BlockStyle.new(:gif01)
  end

  def self.to_select
    TEMPLATES.map{|e| [e.name, e]}
  end

  def valid?
    TEMPLATES.any? {|template| template.name == name }
  end

  private

    def template
       @template ||= TEMPLATES.find {|template| template.name == name }
    end

    def random_color
      colour = "#"
      3.times {
        colour << "%02X" % (rand * 256)
      }
      colour
    end

end
