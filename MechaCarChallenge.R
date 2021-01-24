library(dbplyr)
library(tidyverse)

# MechaCar_mpg Analysis

MechaCar_mpg <- read_csv("MechaCar_mpg.csv")

mpg_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg)
mpg_vl <- lm(mpg ~ vehicle_length, data = MechaCar_mpg)
mpg_vw <- lm(mpg ~ vehicle_weight, data = MechaCar_mpg)
mpg_sa <- lm(mpg ~ spoiler_angle, data = MechaCar_mpg)
mpg_gc <- lm(mpg ~ ground_clearance, data = MechaCar_mpg)
mpg_awd <- lm(mpg ~ AWD, data = MechaCar_mpg)

summary(mpg_lm)
summary(mpg_vl)
summary(mpg_vw)
summary(mpg_sa)
summary(mpg_gc)
summary(mpg_awd)

ggplot(data = MechaCar_mpg, aes(x=mpg, y=vehicle_length)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

ggplot(data = MechaCar_mpg, aes(x=mpg, y=vehicle_weight)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

ggplot(data = MechaCar_mpg, aes(x=mpg, y=spoiler_angle)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

ggplot(data = MechaCar_mpg, aes(x=mpg, y=ground_clearance)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

ggplot(data = MechaCar_mpg, aes(x=mpg, y=AWD)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE)

# Suspension_Coil Analysis

Suspension_Coil <- read_csv("Suspension_Coil.csv")

total_summary <- summarise(Suspension_Coil, mean(PSI), median(PSI), var(PSI), sd(PSI))

lot_summary <- summarise(Suspension_Coil %>% group_by(Manufacturing_Lot), mean(PSI), median(PSI), var(PSI), sd(PSI))

lot_summary

# T-Test on Suspension Coils

tt_all <- t.test(Suspension_Coil$PSI, mu=1500)
tt_lot1 <- t.test(subset(Suspension_Coil,Suspension_Coil$Manufacturing_Lot=="Lot1")$PSI, mu=1500)
tt_lot2 <- t.test(subset(Suspension_Coil,Suspension_Coil$Manufacturing_Lot=="Lot2")$PSI, mu=1500)
tt_lot3 <- t.test(subset(Suspension_Coil,Suspension_Coil$Manufacturing_Lot=="Lot3")$PSI, mu=1500)

tt_all
tt_lot1
tt_lot2
tt_lot3

