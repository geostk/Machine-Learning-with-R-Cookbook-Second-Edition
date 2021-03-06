install.packages("car")
library(car)
data(Quartet)
str(Quartet)
plot(Quartet$x, Quartet$y1)
lmfit = lm(y1~x, Quartet) 
abline(lmfit, col="red")  
lmfit
plot(Quartet$x, Quartet$y1)
lmfit2 = lsfit(Quartet$x,Quartet$y1)
abline(lmfit2, col="red")  
summary(lmfit)
lmfit = lm(y1~x, Quartet)
newdata = data.frame(x = c(3,6,15))
predict(lmfit, newdata, interval="confidence", level=0.95)
predict(lmfit, newdata, interval="predict")
par(mfrow=c(2,2))
plot(lmfit)
plot(cooks.distance(lmfit))
head(Prestige)
str(Prestige)
attach(Prestige)
model = lm(income~prestige+women)
scatter3d(income~prestige+women, Prestige)
summary(model)
coefficients(model) # Extract model coefficients
confint(model, level=0.95)  # Computes confidence inter-vals for model parameters.
fitted(modelmodel) # Extract model fitted values
residuals(lmfit) # Extract model residuals 
anova(model) # Compute analysis of variance tables for fitted model object
vcov(model) # Calculate variance-covariance matrix for a fitted model object
influence(model) # Diagnose quality of regression fits
model = lm(income ~ prestige + women, Prestige)
newdat = data.frame(prestige = c(75,80), women=c(14,13)) 
predict(model, newdata = newdat)
predict(model, newdata = newdat, interval="predict")
plot(Quartet$x, Quartet$y2)
lmfit = lm(Quartet$y2~poly(Quartet$x,2))
lines(sort(Quartet$x), lmfit$fit[order(Quartet$x)], col = "red")
plot(Quartet$x, Quartet$y2)
lmfit = lm(Quartet$y2~ I(Quartet$x)+I(Quartet$x^2))
plot(Quartet$x, Quartet$y3)
library(MASS)
lmfit = rlm(Quartet$y3~Quartet$x)
abline(lmfit, col="red")
plot(Quartet$x, Quartet$y3)
lmfit = lm(Quartet$y3~Quartet$x)
abline(lmfit, col="red")
str(SLID)
par(mfrow=c(2,2))
plot(SLID$wages ~ SLID$language)
plot(SLID$wages ~ SLID$age)
plot(SLID$wages ~ SLID$education)
plot(SLID$wages ~ SLID$sex)
lmfit = lm(wages ~ ., data = SLID)
summary(lmfit)
lmfit = lm(wages ~ age + sex + education, data = SLID)
summary(lmfit)
par(mfrow=c(2,2))
plot(lmfit)
lmfit = lm(log(wages) ~ age + sex + education, data = SLID)
plot(lmfit)
vif(lmfit)
sqrt(vif(lmfit)) > 2
install.packages("lmtest")
library(lmtest)
bptest(lmfit)
install.packages("rms")
library(rms)
olsfit = ols(log(wages) ~ age + sex + education, data= SLID, x= TRUE, y= TRUE)
robcov(olsfit)
lmfit1 = glm(wages ~ age + sex + education, data = SLID, family=gaussian)
summary(lmfit1)
lmfit2 = lm(wages ~ age + sex + education, data = SLID)
summary(lmfit2)
anova(lmfit1, lmfit2)
data(warpbreaks)
head(warpbreaks)
rs1 = glm(breaks ~ tension, data=warpbreaks, fami-ly="poisson")
summary(rs1)
head(mtcars$vs)
lm1 = glm(vs ~ hp+mpg+gear,data=mtcars, family=binomial)
summary(lm1)
install.packages("mgcv")
library(mgcv)
install.packages("MASS")
library(MASS)
attach(Boston)
str(Boston)
fit = gam(dis ~ s(nox))
summary(fit)
plot(nox, dis)
x = seq(0, 1, length = 500)
y = predict(fit, data.frame(nox = x))
lines(x, y, col = "red", lwd = 2)
plot(fit)
fit2=gam(medv~crim+zn+crim:zn, data=Boston)
vis.gam(fit2)
gam.check(fit)