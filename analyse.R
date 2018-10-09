library(tidyverse)

# mandaty 2018
kandidati18 %>%
  filter(MANDAT=="A")

mandaty18 <- kandidati18 %>%
  filter(MANDAT=="A") %>%
  group_by(NSTRANA) %>%
  summarise(pocet18=n()) %>%
  arrange(desc(pocet18)) %>%
  left_join(cns18)

# mandaty 2014

mandaty14 <- kandidati14 %>%
  filter(MANDAT=="1") %>%
  group_by(NSTRANA) %>%
  summarise(pocet14=n()) %>%
  arrange(desc(pocet14)) %>%
  left_join(cns14)

mandaty_srov  <- mandaty14 %>%
  left_join(mandaty18) %>%
  mutate(zisk=pocet18-pocet14) %>%
  mutate(zisk_pct=pocet18/pocet14*100) %>%
  arrange(zisk)

write_csv(mandaty_srov, "mandaty_srov.csv")  

# kolik mandátů má SPD
kandidati18 %>%
  filter(NSTRANA=="1114") %>%
  filter(MANDAT=="A")

# kde nejvíc mandátů získaly, kde ztratily?

# ČSSD

srov18 <- kandidati18 %>%
  filter(MANDAT=="A") %>%
  filter(NSTRANA=="7") %>%
  group_by(KODZASTUP) %>%
  summarise(pocet18=n())


srov14 <- kandidati14 %>%
  filter(MANDAT=="1") %>%
  filter(NSTRANA=="7") %>%
  group_by(KODZASTUP) %>%
  summarise(pocet14=n())

d <- srov14 %>%
  left_join(srov18) %>%
  left_join(zastupitelstva18)

d$pocet18[is.na(d$pocet18)] <- 0

d <- d %>%
  mutate(rozdil=pocet18-pocet14) %>%
  select(NAZEVZAST, rozdil) %>%
  arrange(rozdil)
  

# Piráti 720

srov18 <- kandidati18 %>%
  filter(MANDAT=="A") %>%
  filter(NSTRANA=="720") %>%
  group_by(KODZASTUP) %>%
  summarise(pocet18=n())


srov14 <- kandidati14 %>%
  filter(MANDAT=="1") %>%
  filter(NSTRANA=="720") %>%
  group_by(KODZASTUP) %>%
  summarise(pocet14=n())

d <- srov14 %>%
  left_join(srov18) %>%
  left_join(zastupitelstva18)

d$pocet18[is.na(d$pocet18)] <- 0

d <- d %>%
  mutate(rozdil=pocet18-pocet14) %>%
  select(NAZEVZAST, rozdil) %>%
  arrange(rozdil)
