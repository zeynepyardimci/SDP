class Survey < ApplicationRecord
  # --- İlişkiler (Associations) ---
  
  # Bir anket bir kullanıcıya ait olabilir, ancak bu zorunlu değil.
  # (Bu satır sizde zaten mevcuttu.)
  belongs_to :user, optional: true
  
  # Bir anketin birden fazla sorusu (questions) olur.
  # Eğer anket silinirse, ona bağlı tüm sorular da silinmelidir.
  has_many :questions, dependent: :destroy
  
  # (Eğer anketlere verilen cevapları (responses/answers) da 
  # ayrı bir modelde tutuyorsanız, bu ilişki de eklenebilir. Örn:
  # has_many :responses, dependent: :destroy)


  # --- Doğrulamalar (Validations) ---
  
  # Her anketin bir 'title' (başlık) alanı olmalıdır ve boş olamaz.
  validates :title, presence: true
  
  # 'description' (açıklama) alanı genellikle opsiyoneldir,
  # bu yüzden zorunlu bir doğrulama eklemiyorum.
end