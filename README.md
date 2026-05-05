# Deniz Kaplumbağası Foto-Tanımlama (Photo-ID) Yazılımı

Bu proje, deniz kaplumbağalarının yüzlerindeki benzersiz pul desenlerini analiz ederek bireysel tanımlama yapabilen otonom bir Çoklu Ajan (Multi-Agent) sistemidir.

## GELİŞME RAPORU

**Proje Adı:** Çoklu Ajan Sistemleri ile Deniz Kaplumbağası Foto-Tanımlama (Photo-ID) Yazılımı  
**Kullanılan Teknolojiler:** Swift, SwiftUI, Swift Concurrency (Actors), PhotosUI

### 1. Projenin Amacı ve Kapsamı
Bu projenin amacı, deniz kaplumbağalarının (Caretta caretta, Chelonia mydas vb.) yüzlerindeki "post-ocular" (göz arkası) pul desenlerini analiz ederek bireysel tanımlama (Photo-ID) yapabilen otonom bir sistem geliştirmektir. Bu yöntem, kaplumbağalara fiziksel marka takma zorunluluğunu ortadan kaldıran invaziv olmayan bir yöntemdir. Proje, 2015 "Chabrolle & Dumont-Dayot" araştırmasını referans alarak TORSOOI gibi veri tabanlarının kullandığı manuel tanımlama süreçlerini otomatize etmeyi hedeflemektedir. Sistem, "Clean Code" standartlarına ve "SOLID" prensiplerine uygun bir Çoklu Ajan (Multi-Agent System - MAS) mimarisi ile tasarlanmaktadır.

### 2. Tamamlanan Çalışmalar ve Temel Mimari
Şu ana kadar projenin iskeleti, ajanların iletişimi, veri tabanı genişletme ve arayüz entegrasyonu tamamlanmıştır.

**A. Clean Code ve Dizin Yapısı:**
Proje okunabilirliği ve modülerliği artırmak adına katmanlı bir mimariyle klasörlenmiştir:
- **Models:** Veri yapıları (`TurtleProfile`).
- **Agents:** Ajan mantıkları ve arayüzleri (`Protocols` ve `Actors`).
- **Data:** 10 bireylik genişletilmiş kaplumbağa veri tabanı (`MockDatabase`).
- **Views:** Gelişmiş kullanıcı arayüzü (`SwiftUI`).

**B. Çoklu Ajan (Multi-Agent) Tasarımı:**
Ajanların birbirinden bağımsız ve eşzamanlı (concurrent) çalışabilmesi için Swift'in `actor` yapısı kullanılmıştır.
- **Vision Agent (Görsel Analiz Ajanı):** Kullanıcıdan gelen fotoğrafı alır ve pul desenlerini (feature) çıkarır. "Güven Skoru" algoritması ile kaplumbağa olmayan görselleri ayırt eder.
- **Matching Agent (Eşleştirme Ajanı):** Vision Agent'tan gelen veriyi alır ve veri tabanını tarayarak en doğru eşleşmeyi bulur.
- **Interface Agent:** Kullanıcı etkileşimini yönetir ve ajanlar arası koordinasyonu asenkron olarak sağlar.

### 3. Mevcut Veri Seti (Dataset)

Uygulama içerisinde tanımlı olan ve Photo-ID süreciyle eşleşen kaplumbağa listesi:

| Name            | Species                  | Location                       | Scute Pattern | Asset Name     |
| :-------------- | :----------------------- | :----------------------------- | :------------ | :------------- |
| gpcm3           | Green (C. mydas)         | Guadeloupe (Malendure)         | 114-126-134   | turtle_gpcm3   |
| Tomy            | Hawksbill (E. imbricata) | Martinique (Les Anses d'Arlet) | 315-325-334   | turtle_tomy    |
| Petite-Terre 01 | Green (C. mydas)         | Guadeloupe (Petite-Terre)      | 216-225-236   | turtle_pt01    |
| Cara            | Loggerhead (C. caretta)  | Caribbean Sea                  | 414-345-334   | turtle_cara    |
| Maly            | Green (C. mydas)         | Guadeloupe (Malendure)         | 126-135-146   | turtle_maly    |
| Hawky           | Hawksbill (E. imbricata) | Martinique (Diamond Rock)      | 215-225-237   | turtle_hawky   |
| Greenie         | Green (C. mydas)         | Guadeloupe (Petit-Canal)       | 114-126-135   | turtle_greenie |
| Shellby         | Hawksbill (E. imbricata) | Martinique (Sainte-Anne)       | 325-335-346   | turtle_shellby |
| Flipper         | Green (C. mydas)         | Guadeloupe (Goyave)            | 145-215-225   | turtle_flipper |
| Loggie          | Loggerhead (C. caretta)  | Caribbean Sea                  | 4-post-ocular | turtle_loggie  |

### 4. SOLID Prensiplerinin Uygulanması
- **Tek Sorumluluk Prensibi (SRP):** VisionAgent sadece görüntü işler, MatchingAgent sadece eşleştirme yapar.
- **Arayüz Ayrımı Prensibi (ISP):** Her ajan için amaca hizmet eden minimal protokoller (`VisionAgentProtocol`, `MatchingAgentProtocol`) yazılmıştır.
- **Bağımlılıkların Ters Çevrilmesi Prensibi (DIP):** `ContentView`, doğrudan ajan sınıflarına değil protokollere bağımlıdır. Bu sayede AI modelleri değişse bile arayüz kodu sabit kalır.

### 5. Mevcut Durum ve Çalışan Özellikler
- Kullanıcı galerisinden fotoğraf seçebilmektedir.
- Vision Agent, fotoğrafın boyut ve kalitesine göre "Güven Analizi" yapmaktadır.
- Sistem, yüklenen farklı görsellere göre dinamik olarak veri setindeki 10 farklı kaplumbağayı ayırt edebilmektedir.
- Eşleşme durumunda kaplumbağanın türü, lokasyonu, açıklaması ve veri tabanındaki fotoğrafı gösterilmektedir.

### 6. Sonraki Adımlar (Hedefler)
- **Vision Agent Entegrasyonu:** Apple CoreML kullanılarak gerçek piksel analizi yapılması üzerine çalışmalar.
- **Harita Desteği:** Tanımlanan kaplumbağaların görüldüğü lokasyonların interaktif harita üzerinde gösterilmesi.
- **Veri Tabanı Genişletmesi:** Lokal verinin JSON veya Cloud Kit üzerinden dinamik olarak yönetilmesi.
