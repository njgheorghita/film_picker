class Film < ActiveRecord::Base
  belongs_to :genre

  def self.total_sales  
    Film.sum("box_office_sales")
  end
end