# Seismic-Hazard-Modeling-Using-Spatio-Temporal-Analysis

<img width="1280" height="804" alt="image" src="https://github.com/user-attachments/assets/c510d59d-0ab3-4c78-bc49-03b2878801e4" />

## Proje Hakkında
Bu proje, **Marmara Bölgesi** ve özellikle **Kuzey Anadolu Fay Zonu (KAFZ)** üzerine odaklanan bir deprem ve fay riski analiz çalışmasıdır.  
Veri seti, 2000 – 2025 yılları arasındaki mikro ve orta ölçekli depremleri içerir ve hem deprem parametrelerini (tarih, büyüklük, derinlik, konum) hem de fay parametrelerini (uzunluk, kayma hızı, tekrarlama aralığı, slip deficit, moment potansiyeli) kapsar.

---

## Veri Seti Genel Bilgiler
- **Toplam kayıt:** 21,605  
- **Sütun sayısı:** 23  
- **Odak Bölge:** Marmara Denizi ve çevresi, KAFZ  
- **Deprem Özellikleri:**  
  - Magnitüd (ML): Min 2.0 – Max 6.2, Ortalama ~2.61  
  - Derinlik: Ortalama 8.4 km, Maksimum 83 km  
- **Fay Özellikleri:**  
  - Fay uzunluğu: Ortalama 16 km (maks. 150 km)  
  - Fay tipi: Doğrultu atımlı  
  - Kayma hızı: Ortalama 3.8 mm/yıl  
  - Slip deficit: Ortalama 0.37 m  
  - Moment potansiyeli: ~10^19 Nm  

---

## Problem Tanımı
Marmara Bölgesi, KAFZ nedeniyle yüksek deprem riski altında bir bölgedir.  
Bölgedeki **gerilme birikimi** ve geçmişteki büyük depremler (ör. 1999 Mw 7.4) göz önüne alındığında:

- Mikro ve orta ölçekli depremlerin dağılımını anlamak  
- Fay segmentlerindeki potansiyel gerilme ve risk alanlarını belirlemek  
- Gelecekte olası büyük depremlere dair ön tahminler yapmak  

gerekir.  

---

## Çözüm ve Analizler
Bu proje ile şu adımlar gerçekleştirilmiştir:

1. **Veri Hazırlığı ve Yükleme:**  
   - CSV veri seti Julia ile okunup, tarih formatları ve gerekli sütunlar düzenlendi.  

2. **Zamansal Analiz:**  
   - Yıllık ve aylık deprem trendleri görselleştirildi.  
   - Ortalama magnitüd değişimi ve deprem yoğunluğu incelendi.  

3. **Mekânsal Analiz:**  
   - Depremler KAFZ ve Marmara odaklı scatter plot ile gösterildi.  
   - Büyük depremler (ML ≥ 5) ve fay segmentleri görselleştirildi.  

4. **Risk Modelleme:**  
   - Basit lojistik regresyon ile büyük deprem olasılığı tahmini  
   - Fay potansiyeli ve slip deficit ile risk göstergesi oluşturuldu.  

5. **Spatio-Temporal Analiz:**  
   - Hem konum hem zaman boyutunda deprem yoğunluğu heatmap olarak görselleştirildi.  

---

## Kullanılan Araçlar ve Kütüphaneler
- **Programlama Dili:** Julia  
- **Veri Analizi:** `DataFrames`, `CSV`, `Dates`, `Statistics`  
- **Görselleştirme:** `StatsPlots`, `Plots`  
- **Modelleme:** `GLM`  

---

## Sonuç
- Marmara ve KAFZ’deki mikro ve orta ölçekli depremler başarıyla analiz edildi.  
- Fay parametreleri ve deprem verileri kullanılarak risk göstergeleri belirlendi.  
- Çıkarılan görselleştirmeler ve heatmap’ler, bölgedeki potansiyel deprem risklerini net olarak ortaya koyuyor.  

---

## İleriye Dönük Çalışmalar
- Interaktif haritalar ve heatmap’ler oluşturmak için **Makie/GeoMakie** entegrasyonu  
- Daha gelişmiş olasılık modelleri (Bayesian, Machine Learning)  
- Tarihsel büyük depremler ile entegre edilmiş fay segment modellemesi  

---

