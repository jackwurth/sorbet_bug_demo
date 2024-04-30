class Member < ApplicationRecord
  belongs_to :group, class_name: "Group", primary_key: "id", foreign_key: "group_id"
end
