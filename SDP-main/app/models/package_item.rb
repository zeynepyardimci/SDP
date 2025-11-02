class PackageItem < ApplicationRecord
  # --- İlişkiler (Associations) ---
  # Bu model, Product ve Package'ı birbirine bağlar.
  belongs_to :product
  belongs_to :package

  # --- Doğrulamalar (Validations) ---
  # Bu tabloda pakete kaç adet ürün eklendiğini de tutabilirsiniz
  # (Eğer migration'da 'quantity' adında bir 'integer' sütun eklediyseniz)
  # validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Bir ürünün bir pakete sadece bir kez ekleneceğinden emin olmak için (quantity yoksa):
  # validates :product_id, uniqueness: { scope: :package_id, message: "bu ürün pakete zaten eklenmiş" }
end