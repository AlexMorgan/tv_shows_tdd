class Character < ActiveRecord::Base
  belongs_to :television_show

  validates :name, presence: true, uniqueness: { scope: :television_show_id,
    case_sensitive: false,
    message: "has already been taken" }
  validates :actor, presence: true
  validates :television_show_id, presence: true


end
