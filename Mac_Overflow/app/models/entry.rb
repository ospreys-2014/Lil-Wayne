class Entry < ActiveRecord::Base
  belongs_to :parent, class_name: "Entry", foreign_key: :parent_id
  has_many :children, class_name: "Entry", foreign_key: :parent_id

  belongs_to :user
end