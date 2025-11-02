class Package < ApplicationRecord
  # --- İlişkiler (Associations) ---
  # 'package_items' ara modeli aracılığıyla birçok 'product' (ürüne) sahip olabilir.
  has_many :package_items, dependent: :destroy # Paket silinirse, ara tablodaki kayıtları da sil
  has_many :products, through: :package_items

  # --- Doğrulamalar (Validations) ---
  # (Daha önceki Cypress testinize göre 'name' alanı vardı)
  validates :name, presence: true
  # 'description' alanı opsiyonel olabilir.
  
  # Eğer bir paketi oluştururken/güncellerken aynı anda içindeki ürünleri de
  # (yani 'package_items' kayıtlarını) yönetmek isterseniz bu satırı eklersiniz:
  # accepts_nested_attributes_for :package_items, allow_destroy: true
end