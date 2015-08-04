class Users < ActiveRecord::Base
  has_many :items
end

class Items < ActiveRecord::Base
  has_many :category
  has_many :attribute, through: :
  has_one :type

end

class Attribute < ActiveRecord::Base
  belongs_to :items
  has_many :physicians, through: :appointments
end
