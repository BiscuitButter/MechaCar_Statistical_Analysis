# MechaCar Statistical Analysis

## Linear Regression to Predict MPG

#### Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?

#### Is the slope of the linear model considered to be zero? Why or why not?

#### Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

## Summary Statistics on Suspension Coils

## T-Tests on Suspension Coils

## Study Design: MechaCar vs Competition

<!-- >
## MechaCarChallenge.R Output
 
> library(dbplyr)
> library(tidyverse)
> 
> # MechaCar_mpg Analysis
> 
> MechaCar_mpg <- read_csv("MechaCar_mpg.csv")

-- Column specification -------------------------------------------------------------------------------------------------------------------------
cols(
  vehicle_length = col_double(),
  vehicle_weight = col_double(),
  spoiler_angle = col_double(),
  ground_clearance = col_double(),
  AWD = col_double(),
  mpg = col_double()
)

> 
> mpg_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg)
> mpg_vl <- lm(mpg ~ vehicle_length, data = MechaCar_mpg)
> mpg_vw <- lm(mpg ~ vehicle_weight, data = MechaCar_mpg)
> mpg_sa <- lm(mpg ~ spoiler_angle, data = MechaCar_mpg)
> mpg_gc <- lm(mpg ~ ground_clearance, data = MechaCar_mpg)
> mpg_awd <- lm(mpg ~ AWD, data = MechaCar_mpg)
> 
> summary(mpg_lm)

Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = MechaCar_mpg)

Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

> summary(mpg_vl)

Call:
lm(formula = mpg ~ vehicle_length, data = MechaCar_mpg)

Residuals:
    Min      1Q  Median      3Q     Max 
-26.303  -7.160  -1.231   9.374  26.670 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)    -25.0622    13.2960  -1.885   0.0655 .  
vehicle_length   4.6733     0.8774   5.326 2.63e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 12.47 on 48 degrees of freedom
Multiple R-squared:  0.3715,	Adjusted R-squared:  0.3584 
F-statistic: 28.37 on 1 and 48 DF,  p-value: 2.632e-06

> summary(mpg_vw)

Call:
lm(formula = mpg ~ vehicle_weight, data = MechaCar_mpg)

Residuals:
    Min      1Q  Median      3Q     Max 
-35.816 -11.252  -2.121   8.573  33.201 

Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
(Intercept)    4.042e+01  7.784e+00   5.193 4.17e-06 ***
vehicle_weight 7.649e-04  1.213e-03   0.631    0.531    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 15.67 on 48 degrees of freedom
Multiple R-squared:  0.008223,	Adjusted R-squared:  -0.01244 
F-statistic: 0.398 on 1 and 48 DF,  p-value: 0.5311

> summary(mpg_sa)

Call:
lm(formula = mpg ~ spoiler_angle, data = MechaCar_mpg)

Residuals:
    Min      1Q  Median      3Q     Max 
-35.024 -11.772  -1.469   9.451  35.228 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)   46.07616    6.92823   6.650 2.53e-08 ***
spoiler_angle -0.01659    0.11488  -0.144    0.886    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 15.73 on 48 degrees of freedom
Multiple R-squared:  0.0004343,	Adjusted R-squared:  -0.02039 
F-statistic: 0.02086 on 1 and 48 DF,  p-value: 0.8858

> summary(mpg_gc)

Call:
lm(formula = mpg ~ ground_clearance, data = MechaCar_mpg)

Residuals:
    Min      1Q  Median      3Q     Max 
-28.788  -9.990  -1.615   7.332  35.803 

Coefficients:
                 Estimate Std. Error t value Pr(>|t|)  
(Intercept)       19.4175    10.8662   1.787   0.0803 .
ground_clearance   2.0222     0.8385   2.412   0.0198 *
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 14.86 on 48 degrees of freedom
Multiple R-squared:  0.1081,	Adjusted R-squared:  0.08949 
F-statistic: 5.816 on 1 and 48 DF,  p-value: 0.01975

> summary(mpg_awd)

Call:
lm(formula = mpg ~ AWD, data = MechaCar_mpg)

Residuals:
    Min      1Q  Median      3Q     Max 
-32.945 -12.627   0.363   8.503  32.687 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   47.313      3.115  15.189   <2e-16 ***
AWD           -4.368      4.405  -0.992    0.326    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 15.57 on 48 degrees of freedom
Multiple R-squared:  0.02007,	Adjusted R-squared:  -0.0003449 
F-statistic: 0.9831 on 1 and 48 DF,  p-value: 0.3264

> 
> ggplot(data = MechaCar_mpg, aes(x=mpg, y=vehicle_length)) + 
+   geom_point() + 
+   geom_smooth(method = "lm", se = FALSE)
`geom_smooth()` using formula 'y ~ x'
> 
> ggplot(data = MechaCar_mpg, aes(x=mpg, y=vehicle_weight)) + 
+   geom_point() + 
+   geom_smooth(method = "lm", se = FALSE)
`geom_smooth()` using formula 'y ~ x'
> 
> ggplot(data = MechaCar_mpg, aes(x=mpg, y=spoiler_angle)) + 
+   geom_point() + 
+   geom_smooth(method = "lm", se = FALSE)
`geom_smooth()` using formula 'y ~ x'
> 
> ggplot(data = MechaCar_mpg, aes(x=mpg, y=ground_clearance)) + 
+   geom_point() + 
+   geom_smooth(method = "lm", se = FALSE)
`geom_smooth()` using formula 'y ~ x'
> 
> ggplot(data = MechaCar_mpg, aes(x=mpg, y=AWD)) + 
+   geom_point() + 
+   geom_smooth(method = "lm", se = FALSE)
`geom_smooth()` using formula 'y ~ x'
> 
> # Suspension_Coil Analysis
> 
> Suspension_Coil <- read_csv("Suspension_Coil.csv")

-- Column specification -------------------------------------------------------------------------------------------------------------------------
cols(
  VehicleID = col_character(),
  Manufacturing_Lot = col_character(),
  PSI = col_double()
)

> 
> total_summary <- summarise(Suspension_Coil, mean(PSI), median(PSI), var(PSI), sd(PSI))
> 
> lot_summary <- summarise(Suspension_Coil %>% group_by(Manufacturing_Lot), mean(PSI), median(PSI), var(PSI), sd(PSI))
> 
> lot_summary
# A tibble: 3 x 5
  Manufacturing_Lot `mean(PSI)` `median(PSI)` `var(PSI)` `sd(PSI)`
* <chr>                   <dbl>         <dbl>      <dbl>     <dbl>
1 Lot1                    1500          1500       0.980     0.990
2 Lot2                    1500.         1500       7.47      2.73 
3 Lot3                    1496.         1498.    170.       13.0  
> 
> # T-Test on Suspension Coils
> 
> tt_all <- t.test(Suspension_Coil$PSI, mu=1500)
> tt_lot1 <- t.test(subset(Suspension_Coil,Suspension_Coil$Manufacturing_Lot=="Lot1")$PSI, mu=1500)
> tt_lot2 <- t.test(subset(Suspension_Coil,Suspension_Coil$Manufacturing_Lot=="Lot2")$PSI, mu=1500)
> tt_lot3 <- t.test(subset(Suspension_Coil,Suspension_Coil$Manufacturing_Lot=="Lot3")$PSI, mu=1500)
> 
> tt_all

	One Sample t-test

data:  Suspension_Coil$PSI
t = -1.8931, df = 149, p-value = 0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 
  1498.78 

> tt_lot1

	One Sample t-test

data:  subset(Suspension_Coil, Suspension_Coil$Manufacturing_Lot == "Lot1")$PSI
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 

> tt_lot2

	One Sample t-test

data:  subset(Suspension_Coil, Suspension_Coil$Manufacturing_Lot == "Lot2")$PSI
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 

> tt_lot3

	One Sample t-test

data:  subset(Suspension_Coil, Suspension_Coil$Manufacturing_Lot == "Lot3")$PSI
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14
