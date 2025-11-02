class Scale < ApplicationRecord
  # --- İlişkiler (Associations) ---
  
  # Bir ölçek (scale) bir kullanıcıya ait olabilir, ancak bu zorunlu değil.
  # (Bu satır sizde zaten mevcuttu.)
  belongs_to :user, optional: true


  # --- Doğrulamalar (Validations) ---
  
  # 'Scale' modelinizin alanlarına göre burayı düzenlemeniz gerekir.
  # Çoğu modelde bir 'name' (isim) alanı olduğu için örnek olarak ekliyorum.
  validates :name, presence: true
  
  # Örneğin, 'Scale' bir 'değer' (value) veya 'tür' (scale_type) tutuyorsa,
  # aşağıdaki gibi doğrulamalar ekleyebilirsiniz:
  
  # validates :value, presence: true, numericality: true
  # validates :scale_type, presence: true

end