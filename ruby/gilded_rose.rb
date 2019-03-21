require 'pry'
class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert" && item.name != "Sulfuras, Hand of Ragnaros"
        if item.quality <= 50
          if item.quality > 0
            item.quality -= 1
          else
            item.quality -= item.quality
          end
        else
          item.quality = 50
        end
      else
        if item.quality < 50 && item.name != "Sulfuras, Hand of Ragnaros"
          item.quality += 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11 && item.sell_in > 5 && item.quality < 50
              item.quality += 1
            end
            if item.sell_in < 6 && item.quality < 50
              item.quality += 2
            end
          end
        elsif item.name != "Sulfuras, Hand of Ragnaros"
          item.quality = 50
        end
      end

      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end

      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros"
              item.quality -= 1
            end
          else
            item.quality -= item.quality
          end
        elsif item.quality < 50
          item.quality += 1
        end
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
