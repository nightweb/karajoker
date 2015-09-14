class Song
  attr_reader :year, :title, :author

  def initialize(year, title, author)
    @year = year
    @title = title
    @author = author
  end

  def attributes
    { year: year, title: title, author: author }
  end

  def eql?(other)
    self.title == other.title
  end

  def ==(other)
    self.title == other.title
  end

  def hash
    self.title.hash
  end
end
