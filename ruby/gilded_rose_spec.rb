require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'pry'
describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "degrades quality" do
      items = [Item.new("foo", 0, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to  be < 40
    end

    it "quality does not negative" do
      items = [Item.new("foo", 0, -1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to  be >= 0
    end

    it "Aged Brie quality should increase" do
      items = [Item.new("Aged Brie", 0, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to  be > 1
    end

    it "quality cannot more than 50" do
      items = [Item.new("foo", 6, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to  be <= 50
    end

    it "Sulfuras, Hand of Ragnaros quality cannot change" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 6, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to  eq 80
    end

    it "Backstage passes quality should increase by 3" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to  be > 3
    end

    it "Backstage passes quality should increase by 2" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to  be > 2
    end

    it "Backstage passes quality should zero for sellin complete" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eql 0
    end

    it "Conjured Mana Cake quality should degrades" do
      items = [Item.new("Conjured Mana Cake", 1, 3)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to be < 3
    end

  end

end
