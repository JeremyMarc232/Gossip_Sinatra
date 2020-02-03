require 'csv'
class Gossip
  attr_accessor :author, :content
  @@count = 0
  def initialize(author, content)
   @author = author
   @content = content
  end

  def save
    @@count += 1
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content, @@count]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

end
