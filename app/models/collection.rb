class Collection
  include Mongoid::Document
  field :name, :type => String
  embeds_many :contents

  attr_accessible :name, :csv_rows

  validates :name, presence: true
  validates :name, uniqueness: true

  def skip_head
  end

  def csv_text_input
  end

  def csv_rows=(rows)
    rows.each do |key, val|
      self.contents.build(key:key, val:val)
    end
  end
end
