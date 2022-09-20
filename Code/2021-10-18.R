table_1 = data.frame("관측치" = 1:15 ,"집 크기" = c(1380, 3120, 3520, 1130, 1030, 1720, 3920, 1490, 1860, 3430, 2000, 3660, 2500, 1220, 1390), "집 가격" = c(76, 216, 238, 69, 50, 119, 282, 81, 132, 228, 145, 251, 170, 71, 29))
table_1


#plot
plot(table_1$집.가격, table_1$집.크기, cex = 2, type = "p")

#mean
x_mean = mean(table_1$집.크기)
y_mean = mean(table_1$집.가격)


w1 = sum((table_1$집.크기 - x_mean) * (table_1$집.가격 - y_mean))
w1 = w1 / sum((table_1$집.크기 - x_mean)**2)

w0 = y_mean - (w1*x_mean)
w1 #기울기
w0 #constraint

# lm // ret coefficient(계수) vector[n]

model1 = lm (table_1$집.가격 ~ table_1$집.크기)
model1$coefficient[1]
model1$coefficient[2]

# predict
predict(model1, newdata=data.frame(집.크기.=2227), interval="confidence")
predict(model1, newdata = data.frame(c(2227)))
fitted(model1)

install.packages("chemCal")
library(chemCal)
inverse.predict(model1, data.frame(c(150)))

#result
ans1_1 = w0 + w1*2227
ans1_1

ans1_2 = (150 - w0) / w1
ans1_2

ans1_3 = sum(model1$residuals)
ans1_3 #0에 근접

table_2 = data.frame(x = 1:10, y = c(3,3,3,6,6,9,9,9,10,11)) #x = 11 is input
#table_2
model2 = lm(table_2$y ~ table_2$x)
w0 = model2$coefficients[1]
w1 = model2$coefficients[2]
#w0
#w1
ans2_1 = w0 + w1 * 11
ans2_1 %>% sum


table_3 = data.frame(
  "기업" = LETTERS[1:10], 
  "X: 광고비(억 원)" = c(36.5, 28.0, 42.9, 52.0, 51.5, 53.8, 25.4, 37.2, 50.9, 29.2), 
  "Y: 신규고객(100명)" = c(14, 9, 15, 20, 21, 25, 9, 13, 20, 10))
View(table_3)

model3 = lm(X..광고비.억.원. ~ Y..신규고객.100명., data = table_3)

w0 = model3$coefficients[1]
w0
w1 = model3$coefficients[2]
w1

predict.lm(model3, newdata = data.frame('Y: 신규고객(100명)' = 17))

# input에 대한 예측을 하고 싶을 경우...
calc1 <- function(x1)
{
  (w0 + w1 * x1) - 17
}
ans3_1 = uniroot(calc1, c(0, 10000))
ans3_1$root

set.seed(1)
x1 <- sample(2:30, 25)
set.seed(2)
x2 <- sample(36:1460, 25)
set.seed(3)
y <- round(2.341 + 1.6159*x1 + 0.015*x2 + rnorm(25,0,3.25),2) 
df1 <- data.frame(x1,x2,y)
View(df1)

x <- cbind(1, x1, x2)
x <- as.matrix(x)
x <- unname(x)
x
y1 <- as.matrix(y)
y1 


w.hat <- solve(t(x) %*% x) %*% t(x) %*% y1 #Transpose Matrix
y_hat.1 = w.hat %*% x
reg1 <- lm(y ~ x1 + x2, data=df1)
view(df1)

reg1$residuals

y1 - (x %*% w.hat)

res <- (y1 - (x %*% w.hat)) %>% as.vector
res %<>% sum
reg1$residuals == res


state <- as.data.frame(state.x77)
x_4 <- cbind(1, state[,c(1:4,7)])
x_4 <- as.matrix(x_4)
#View(x_4)
y_4 <- state[, 5]
y_4 <- as.matrix(y_4)
#View(y_4)
w_hat_4 <- solve(t(x_4) %*% x_4) %*% t(x_4) %*% y_4
w_hat_4 %>% sum

model5 <- lm(Murder ~ Population + Income + Illiteracy + `Life Exp` + Frost, data=state)
model5$coefficients %>% sum
model5 %>% summary()
model5$fitted.values


set.seed(1)
x1 <- sample(2:30, 25)
set.seed(2)
x2 <- sample(36:1460, 25)
set.seed(3)
y <- round(2.341 + 1.6159*x1 + 0.015*x2 + rnorm(25,0,3.25),2) 
df1 <- data.frame(x1,x2,y)
View(df1)

model6 <- lm(df1$y ~ df1$x1 + df1$x2)

y.hat <- model6$fitted.values
y.bar <- mean(df1$y)

summary(model6)

df6 = data.frame("판매원 수" = c(14, 16, 13, 10, 18, 17, 16, 15, 11, 10), "광고비" = c(37, 43, 38, 42, 36, 33, 40, 35, 34, 29), "월간 매출액" = c(850, 970, 730, 940, 920, 830, 940, 900, 760, 710))
model7 <- lm(df6[, 3] ~ df6[, 1] + df6[, 2])
summary(model7)

y.hat2 <- model7$fitted.values
y.hat2
y.bar2 <- mean(df6[, 3])
SSE <- (df6[, 3] - y.hat2)^ 2
SSR <- (y.hat2 - y.bar2)^ 2

sum(SSE)
deviance(model7)

sum(SSR)

SST <- sum(SSE) + sum(SSR)
SST
