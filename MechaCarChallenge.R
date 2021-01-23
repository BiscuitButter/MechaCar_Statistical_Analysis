library(dplyr)
MechaCar_mpg <- read_csv("MechaCar_mpg.csv")

mpg_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg)

summary(mpg_lm)

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
