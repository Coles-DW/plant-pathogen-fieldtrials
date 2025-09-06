# =============================================================================
# 04_analysis.R
# Purpose: Analysis for shoots, florets, bunches, shelf, and qpcr
# Dependencies: tidyverse, lme4, car, emmeans, ggeffects
# =============================================================================

library(tidyverse)
library(lme4)
library(car)
library(emmeans)
library(ggeffects)

# Shoot weight by treatment
m1 <- lmer(log(shoot_weight) ~ trt + (1|plot), data=shoots)
plot(m1)
summary(m1)
Anova(m1, test='F')
contrast(emmeans(m1, ~ trt), 'dunnett')

# Cumulative yield
m2 <- lmer(cumul_bunchweight ~ trt * harvest + (1|plot/plant), data=bunches)
plot(m2)
summary(m2)
Anova(m2, test='F')
contrast(emmeans(m2, ~ trt | harvest), 'dunnett')

# Floret size
m3 <- lmer(log(length) ~ trt * harvest + (1|plot/plant), data=florets)
plot(m3)
summary(m3)
Anova(m3, test='F')
contrast(emmeans(m3, ~ trt | harvest), 'dunnett')

# Qpcr pathogen presence
m4 <- glmer(qpcr_detected ~ Treatment + (1|plot), data=qpcr, family=binomial)
plot(m4)
summary(m4)
Anova(m4)
contrast(emmeans(m4, ~ Treatment), 'dunnett')

