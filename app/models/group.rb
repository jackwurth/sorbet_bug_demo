class Group < ApplicationRecord
  extend T::Sig
  has_many :sub_groups, class_name: "Group", primary_key: "id", foreign_key: "parent_id"
  belongs_to :parent_group, class_name: "Group", primary_key: "id", foreign_key: "parent_id", optional: true

  has_many :members, class_name: "Member", primary_key: "id", foreign_key: "group_id"

  has_many :child_group_members, through: :sub_groups

  sig {returns(T::Array[Member])}
  def child_members
    members = T.let([], T::Array[Member])
    self.sub_groups.each do |sub_group|
      members += sub_group.members
    end
    return members
  end
end
