library(readxl)
library(xml2)

# 2018
download.file("http://80.188.53.60/texty/KV2018reg20181007_xlsx.zip", "KV2018reg20181031_xlsx.zip")
unzip("KV2018reg20181031_xlsx.zip")
zastupitelstva18 <- read_excel("kvrzcoco.xlsx")
strany18 <- read_excel("kvros.xlsx")
kandidati18 <- read_excel("kvrk.xlsx")
file.remove(list.files(pattern="*.xlsx|*.xml|*.zip"))

# 2014
download.file("https://volby.cz/opendata/kv2014/KV2014reg20141014_xlsx.zip", "KV2014reg20141014_xlsx.zip")
unzip("KV2014reg20141014_xlsx.zip")
zastupitelstva14 <- read_excel("kvrzcoco.xlsx")
strany14 <- read_excel("kvros.xlsx")
kandidati14 <- read_excel("kvrk.xlsx")
file.remove(list.files(pattern="*.xlsx|*.xml|*.zip"))

# číselník okresů 2018
download.file("https://volby.cz/opendata/kv2018/KV2018ciselniky20181031.zip", "ciselniky.zip")
unzip("ciselniky.zip")
nuts18 <- read_excel("cnumnuts.xlsx")
file.remove(list.files(pattern="*.xlsx|*.xml|*.zip"))

# číselník politické příslušnosti kandidátů 2018
download.file("https://volby.cz/opendata/kv2018/KV2018ciselniky20181031.zip", "ciselniky.zip")
unzip("ciselniky.zip")
cpp18 <- read_excel("cpp.xlsx")
file.remove(list.files(pattern="*.xlsx|*.xml|*.zip"))

# číselník navrhujících stran 2018
download.file("https://volby.cz/opendata/kv2018/KV2018ciselniky20181031.zip", "ciselniky.zip")
unzip("ciselniky.zip")
cns18 <- read_excel("cns.xlsx")
file.remove(list.files(pattern="*.xlsx|*.xml|*.zip"))

# číselník navrhujících stran 2014
cns14 <- read_csv("cns14.csv")

