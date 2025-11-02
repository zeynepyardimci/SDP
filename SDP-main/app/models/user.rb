class User < ApplicationRecord
  # --- Kimlik Doğrulama ---
  # (Bu satır sizde zaten mevcuttu)
  # 'password' ve 'password_confirmation' alanlarını yönetir,
  # 'password_digest' sütununa şifrelenmiş halini kaydeder.
  has_secure_password

  # --- İlişkiler (Associations) ---
  # Diğer modellerde 'belongs_to :user' dediğimiz için,
  # burada 'has_many' (çoğuna sahip) ilişkilerini tanımlamalıyız.
  
  # Bir kullanıcı silinirse, ona ait tüm projeler de silinir.
  has_many :projects, dependent: :destroy
  
  # Bir kullanıcı silinirse, ona ait tüm ölçekler de silinir.
  has_many :scales, dependent: :destroy
  
  # Bir kullanıcı silinirse, ona ait tüm anketler de silinir.
  has_many :surveys, dependent: :destroy

  # --- Doğrulamalar (Validations) ---
  
  # E-posta alanı zorunlu, benzersiz (büyük/küçük harf duyarsız)
  # ve geçerli bir formatta olmalıdır.
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "geçerli bir e-posta adresi olmalıdır" }

  # 'has_secure_password' zaten yeni kayıt olurken şifrenin
  # boş olmamasını kontrol eder. Biz sadece minimum uzunluk kuralı ekleyelim.
  # 'allow_nil: true' ekliyoruz çünkü kullanıcı şifresini değil de 
  # e-postasını güncellerken şifre girmek zorunda kalmamalı.
  validates :password, length: { minimum: 6 }, allow_nil: true
  
  # (Eğer bir 'username' alanı da kullanıyorsanız, 
  # onun için de doğrulama ekleyebilirsiniz.)
  # validates :username, presence: true, uniqueness: true

end