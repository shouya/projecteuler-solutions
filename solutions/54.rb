

RANK_LIST = {
  :high_card => 0,
  :one_pair => 1,
  :two_pairs => 2,
  :three_of_a_kind => 3,
  :straight => 4,
  :flush => 5,
  :full_house => 6,
  :four_of_a_kind => 7,
  :straight_flush => 8,
  :royal_flush => 9
}

SUITS = [1, 2, 3, 4].freeze
VALUES = (2..14).to_a.freeze

class Card
  include Comparable

  attr_accessor :suit, :value
  class << self
    def convert_value(str)
      case str
      when 'T' then 10
      when 'J' then 11
      when 'Q' then 12
      when 'K' then 13
      when 'A' then 14
      else str.to_i
      end
    end
    def convert_suit(str)
      case str
      when 'H' then 0
      when 'C' then 1
      when 'S' then 2
      when 'D' then 3
      end
    end
  end

  def load(str)
    @value = Card.convert_value(str[0])
    @suit = Card.convert_suit(str[1])
    self
  end

  def <=>(another)
    (@value * 4 + @suit) <=> (another.value * 4 + another.suit)
  end
end

class Hand
  include Comparable

  attr_accessor :cards

  def load(list)
    @cards = list.map do |x|
      Card.new.tap {|c| c.load(x) }
    end
    self
  end

  def flush?
    return nil unless @cards.map(&:suit).uniq.length == 1
    @cards.map(&:value).sort.last
  end
  def straight?
    values = @cards.map(&:value).sort
    return nil unless values.uniq.length == values.length
    return nil unless values[-1] - values[0] == values.length - 1
    values[-1]
  end
  def n_of_kind
    values = @cards.map(&:value).sort
    values.delete_if {|x| values.count(x) == 1}
    uniq_vals = values.dup.uniq
    uniq_vals.zip(uniq_vals.map {|x| values.count(x) })
  end

  def evaluate
    @cards.sort!

    if s = straight? and f = flush?
      if @cards.sort.first.value == 10
        return [:royal_flush, 0, @cards]
      end
      return [:straight_flush, s, @cards]
    end

    groups = n_of_kind
    if groups.map(&:last) == [1]
      return [:four_of_a_kind, groups[0].first, @cards]
    end
    if groups.map(&:last).sort == [2, 3]
      return [:full_house, groups.map(&:first).sort.last, @cards]
    end
    if f = flush?
      return [:flush, f, @cards]
    end
    if s = straight?
      return [:straight, s, @cards]
    end

    case groups.map(&:last).sort
    when [3]
      return [:three_of_a_kind, groups[0].first, @cards]
    when [2, 2]
      return [:two_pairs, groups.map(&:first).sort.last, @cards]
    when [2]
      return [:one_pair, groups[0].first, @cards]
    end

    return [:high_card, cards.map(&:value).sort.last, @cards]
  end

  def <=>(another)
    lhs = evaluate.tap {|x| x[0] = RANK_LIST[x[0]] }
    rhs = another.evaluate.tap {|x| x[0] = RANK_LIST[x[0]] }
    lhs <=> rhs
  end

end



list = File.read('54.data').each_line.to_a.map do |x|
  a = x.split(' ')
  [a[0,5], a[5..-1]]
end

counter = 0
list.each do |(x,y)|
  counter += 1 if Hand.new.tap {|a| a.load(x) } > Hand.new.tap {|a| a.load(y) }
end

puts counter

