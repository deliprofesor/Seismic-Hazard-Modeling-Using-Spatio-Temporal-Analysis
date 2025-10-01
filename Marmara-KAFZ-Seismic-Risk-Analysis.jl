using CSV, DataFrames, Dates, StatsPlots, GLM, Statistics

# Veri Yükleme
eq_data = CSV.read("marmara_faults_earthquakes_2000_2025.csv", DataFrame)

# Tarih tipini düzelt
eq_data.time = DateTime.(eq_data.time)

# Büyük deprem (ML ≥5) için binary değişken
eq_data.big_quake = eq_data.ML .>= 5

# Zamansal Analiz: yıllara göre ortalama büyüklük
eq_data.year = year.(eq_data.time)
yearly_avg = combine(groupby(eq_data, :year), :ML => mean => :avg_mag)

@df yearly_avg plot(:year, :avg_mag, 
    xlabel="Yıl", ylabel="Ortalama Magnitüd", 
    label="Yıllık Ortalama Magnitüd", lw=2, color=:red,
    title="2000-2025 Marmara Bölgesi Deprem Trendleri")

#  Mekânsal Analiz: KAFZ ve Marmara odaklı
# Scatter plot, büyüklüğe göre renk
@df eq_data scatter(:longitude, :latitude, 
    markersize=4, color=:ML, 
    xlabel="Longitude", ylabel="Latitude",
    title="Marmara Bölgesi Deprem Noktaları (ML büyüklüğe göre)",
    colorbar_title="Magnitüd")

# 4️Fay parametreleri ile basit risk göstergesi
# Fay potansiyeli ve kayma hızı ile büyük deprem olasılığı
eq_data.fay_risk = @. eq_data.slip_deficit * eq_data.moment_potential

# Basit lojistik regresyon (derinlik ve büyüklük ile)
model = glm(@formula(big_quake ~ depth + ML + fay_risk), eq_data, Binomial(), LogitLink())
println(coeftable(model))

# Spatio-Temporal Heatmap: aylık deprem sayısı (KAFZ odaklı)
eq_data.month = Dates.floor.(eq_data.time, Dates.Month)
monthly_counts = combine(groupby(eq_data, [:month]), nrow => :event_count)

@df monthly_counts plot(:month, :event_count, 
    xlabel="Ay", ylabel="Deprem Sayısı", lw=2, 
    label="Aylık Deprem Olayı", title="2000-2025 Aylık Deprem Yoğunluğu")

# Basit Fay Segment Heatmap (ML ≥5)
using Plots
# Noktaları büyüklüğe göre renkli göster
big_eq = filter(row -> row.ML >= 5, eq_data)
scatter(big_eq.longitude, big_eq.latitude, 
    markersize=6, color=:ML, 
    xlabel="Longitude", ylabel="Latitude",
    title="ML ≥5 Depremler ve Fay Potansiyeli", colorbar_title="Magnitüd")
