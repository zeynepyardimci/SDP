# SDP Scale Development Platform - API Sunucusu

Bu depo, SDP (Scale Development Platform) uygulamasının backend API sunucusunu içerir. SDP, psikolojik ve tıbbi ölçeklerin geliştirilmesi, doğrulanması, yönetimi ve dağıtımı için kapsamlı bir ekosistem sağlamayı hedefler.

## 🚀 Amaç

Bu API sunucusu, SDP platformunun frontend uygulamaları (web arayüzleri, mobil uygulamalar vb.) veya diğer harici servisler tarafından kullanılacak olan veri ve iş mantığını sağlar. Ölçekler, anketler, projeler, kullanıcılar, kredi sistemi ve analizler gibi temel kaynakları yönetir.

## ✨ Temel Özellikler (Mevcut & Planlanan)

* **Ölçek Deposu Yönetimi:** Ölçek oluşturma, versiyonlama, paylaşma, PDF'ten veri çekme (planlanan).
* **Anket Yönetimi:** Ölçeklerden anket oluşturma, dağıtma, yanıt toplama.
* **Proje Yönetimi:** Araştırma projeleri oluşturma, analizleri gruplama.
* **Kullanıcı Yönetimi:** Temel kullanıcı kayıt ve kimlik doğrulama altyapısı.
* **Kredi Sistemi:** Platform özelliklerinin kullanımını yönetmek için paketler ve bakiye takibi.
* **Analiz Yetenekleri:** Temel CRUD işlemleri (ileride istatistiksel analizler eklenecek).

## 🛠️ Kullanılan Teknolojiler

* **Backend:** Ruby on Rails 8 (API-Only Modu)
* **Veritabanı:** PostgreSQL (veya projenin kurulumuna göre SQLite)
* **Ruby Versiyonu:** 3.x (Projenin `.ruby-version` dosyasına bakınız)
* **API Formatı:** JSON

## 🏁 Başlarken

Bu projeyi yerel makinenizde kurmak ve çalıştırmak için aşağıdaki adımları izleyin.

### Gereksinimler

* Ruby (Projenin `.ruby-version` dosyasına uygun versiyon)
* Bundler (`gem install bundler`)
* PostgreSQL (veya SQLite) veritabanı sunucusu
* Node.js ve npm (JavaScript bağımlılıkları için)

### Kurulum

1.  **Depoyu Klonlayın:**
    ```bash
    git clone [https://github.com/zeynepyardimci/SDP.git](https://github.com/zeynepyardimci/SDP.git)
    cd SDP
    ```
    *(Not: Depo adını kendi oluşturduğun adla değiştir.)*

2.  **Bağımlılıkları Yükleyin:**
    ```bash
    bundle install
    npm install
    ```

3.  **Veritabanını Ayarlayın:**
    * `config/database.yml` dosyasını kendi veritabanı ayarlarınıza göre düzenleyin (kullanıcı adı, şifre vb.).
    * Veritabanlarını oluşturun ve şemayı yükleyin:
        ```bash
        rails db:create
        rails db:migrate
        ```

### Sunucuyu Çalıştırma

Aşağıdaki komutla Rails API sunucusunu başlatın:
```bash
rails server
````
Sunucu varsayılan olarak http://localhost:3000 adresinde çalışacaktır.

## 📡 API Kullanımı

API'ın ana giriş noktası (base URL) /api/v1/ şeklindedir.

Mevcut Temel Uç Noktalar (Endpoints):
* GET /api/v1/ : Hoş geldin mesajı

* GET /api/v1/users : Tüm kullanıcıları listeler

* GET /api/v1/users/:id : Belirli bir kullanıcıyı gösterir

* POST /api/v1/users : Yeni bir kullanıcı oluşturur

* GET /api/v1/scales : Tüm ölçekleri listeler

* POST /api/v1/scales : Yeni bir ölçek oluşturur

* GET /api/v1/scales/:id : Belirli bir ölçeği gösterir

* PATCH/PUT /api/v1/scales/:id : Belirli bir ölçeği günceller

* DELETE /api/v1/scales/:id : Belirli bir ölçeği siler

* GET /api/v1/projects : Tüm projeleri listeler

* POST /api/v1/projects : Yeni bir proje oluşturur

* GET /api/v1/projects/:id : Belirli bir projeyi gösterir

* PATCH/PUT /api/v1/projects/:id : Belirli bir projeyi günceller

* DELETE /api/v1/projects/:id : Belirli bir projeyi siler

* GET /api/v1/surveys : Tüm anketleri listeler

* POST /api/v1/surveys : Yeni bir anket oluşturur

* GET /api/v1/surveys/:id : Belirli bir anketi gösterir
  
* PATCH/PUT /api/v1/surveys/:id : Belirli bir anketi günceller

* DELETE /api/v1/surveys/:id : Belirli bir anketi siler

* GET /api/v1/packages : Tüm paketleri listeler

* POST /api/v1/packages : Yeni bir paket oluşturur

* GET /api/v1/packages/:id : Belirli bir paketi gösterir

* PATCH/PUT /api/v1/packages/:id : Belirli bir paketi günceller

* DELETE /api/v1/packages/:id : Belirli bir paketi siler

## Test Etme
API endpoint'lerini test etmek için Postman gibi bir araç kullanmanız önerilir. İstek gönderirken Content-Type: application/json header'ını eklemeyi unutmayın.
