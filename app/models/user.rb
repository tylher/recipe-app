class User< ApplicationRecord
    has_many :foods, class_name: "food", foreign_key: "user_id"
    has_many :foods, class_name: "food", foreign_key: "user_id"
end