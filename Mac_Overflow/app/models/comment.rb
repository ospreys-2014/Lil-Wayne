class Comment < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user
  belongs_to :parent, class_name: "Comment", foreign_key: :parent_id
  has_many :children, class_name: "Comment", foreign_key: :parent_id

  belongs_to :user
end