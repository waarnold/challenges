class School
  attr_reader :roster

  def initialize
    @roster = {}
  end

  def add(student, grade)
    if roster.has_key?(grade)
      roster[grade] << student
    else
      roster[grade] = [student]
    end
  end

  def grade(_grade)
    if roster.has_key?(_grade)
      roster[_grade]
    else
      roster[_grade] = []
    end
  end

  def to_h
    sorted!(roster)
  end

  private

  def sorted!(hash)
    hash.each {|k, v| v.sort!}
    Hash[hash.sort!]
  end
end

=begin

This solution took first place among all submissions to Launch School. Cool stuff.
I did think to myself, "Man, it would make things so much easier if values could
just be initialize as empty arrays." Enter this elegant solution. Another problem with
my solution is probably that I'm sorting keys and values in one place? I don't really
need a separate sorted! method, and the fact that I'm doing two separate things within it
probably does not follow best practices.

class School
  attr_reader :roster

  def initialize
    @roster = Hash.new { |roster, grade| roster[grade] = [] }
  end

  def add(student, grade)
    roster[grade] << student
  end

  def grade(num)
    roster[num]
  end

  def to_h
    roster.sort.map { |grade, list| [grade, list.sort] }.to_h
  end
end
=end
