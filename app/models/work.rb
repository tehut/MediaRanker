class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: true, uniqueness: true
  validates :created_by, presence: true

  validates :category, presence: true , inclusion: { in: %w(album movie book)}

  def self.show_category(cat)
    chosen = []
    all = Work.all
    all.each{|item| item.category == cat ? (chosen << item ): next}
    return chosen
  end

  def self.most_votes
    a = Work.all
    b = {}
      a.each{|work| b[work.id] = work.votes.length}
      b.max_by{|k,v| v}
  end




end
