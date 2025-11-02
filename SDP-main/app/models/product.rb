class Product < ApplicationRecord
  # --- İlişkiler (Associations) ---
  # Bir ürünün birden fazla pakette olabileceğini varsayarsak (many-to-many ilişki),
  # 'package_items' adında bir ara modele (join table) ihtiyacımız var.
  
  # Bir ürün, 'package_items' aracılığıyla birçok 'package' (pakete) sahip olabilir.
  has_many :package_items, dependent: :destroy # Ürün silinirse, ara tablodaki kayıtları da sil
  has_many :packages, through: :package_items

  # --- Doğrulamalar (Validations) ---
  # 'name' ve 'price' alanlarının var olmasını zorunlu kıl.
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  # Stok adedi (eğer varsa) tamsayı ve 0'dan büyük/eşit olmalı
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true # (nil'e izin ver, yani stok takibi zorunlu değilse)
  
  # Not: Kontrolördeki 'product_params' metodunuzu da buradaki alanlarla
  # (örn: :name, :description, :price, :stock_quantity) eşleşecek şekilde güncellemelisiniz.
end