
# Classting Code
set.seed(123)
x <- runif(1000, -5, 5)
y <- x + rnorm(1000) + 3

plot(x,y, pch=16,
     xlab = "x", ylab="y",
     cex=1.5, col=rgb(0.2,0.4,0.6,0.4))

reg <- lm(y ~ x)
reg$coefficients
abline(reg, col="green",lwd=5)

# 비용함수
n <- length(y)
cost <- function(X, y, w) t((y - X%*%w)) %*% (y - X%*%w)/(2*n)

# 벡터, 행렬로 표현
X <- cbind(1,matrix(x))
y <- as.matrix(y)

# 학습률, 반복횟수
alpha <- 0.02
num_iters <- 600

# cost, w 저장
cost_history <- double(num_iters)
w_history <- list(num_iters)

# 초기화
w <- matrix(c(0,0), nrow=2)

# gradient descent
for (i in 1:num_iters) {
  grad <- t(X) %*% (X %*% w - y) / n
  w <- w - alpha * grad
  cost_history[i] <- cost(X, y, w)
  w_history[[i]] <- w
}
print(w)

# 경사하강법 시각화
for (i in c(1,3,6,10,14,seq(20, num_iters, by=10)))
  abline(coef=w_history[[i]], col=rgb(0.8,0,0,0.3))

# cost 변화
plot(cost_history, type='l',
     xlab='Iterations', ylab='Cost',
     col='orange', lwd=2)


#2011-11-01 경사하강법 예제
set.seed(1)
x1 <- sample(2:30, 25)
set.seed(2)
x2 <- sample(36:1460, 25)
set.seed(3)
y <- round(2.341 + 1.6159*x1 + 0.015*x2 + rnorm(25,0,3.25),2) 
df1 <- data.frame(x1,x2,y)
View(df1)

x1.1 <- cbind(1, x1, x2)
x1.1 <- as.matrix(x1.1)
View(x1.1)
model2 <- lm(y~x1+x2)
model2$coefficients


y <- as.matrix(y)
n <- length(y)
n

alpha <- 0.0000001
num_iters <- 10000000

# cost, w 저장
cost_history <- double(num_iters)
w_history <- list(num_iters)
w <- matrix(c(1,2,0), nrow = 3)


for (i in 1:num_iters) {
  grad <- t(x1.1) %*% (x1.1 %*% w - y) / n
  w <- w - alpha * grad
  cost_history[i] <- cost(x1.1, y, w)
  w_history[[i]] <- w
}
w %>% print


#2011-11-01 경사하강법 과제

state <- as.data.frame(state.x77)
model3 <- lm(Murder ~ Population + Income + Illiteracy + `Life Exp` + Frost,data = state)

x2.1 <- cbind(1, state$Population,  state$Income, state$Illiteracy, state$`Life Exp`, state$Frost)
x2.1 <- as.matrix(x2.1)
View(x2.1)
y2.1 <- as.matrix(state$Murder)
View(y2.1)
n2 <- length(y2.1)

cost <- function(X, y, w)  (t((y - X%*%w)) %*% (y - X %*% w)) / (2*n2)

alpha <- 0.00000001
num_iters <- 500

cost_history.2 <- double(num_iters)
w_history.2 <- list(num_iters)
w2.1 <- matrix(c(0, 0, 0, 0, 0, 0), nrow = 6)

for (i in 1:num_iters) {
  grad <- (t(x2.1) %*% (x2.1 %*% w2.1 - y2.1)) / n2
  w2.1 <- w2.1 - alpha * grad
  w2.1 %>% print
  cost_history.2[i] <- cost(x2.1, y2.1, w2.1)
  w_history.2[[i]] <- w2.1
}
w2.1 %>% print
model3$coefficients


# 나이에 따른 질병유무 분포
# 이진 분류, 로지스틱을 표현하였음

age <- c(22,23,24,27,28,30,30,32,33,35,38,40,41,46,47,48,49,49,50,
         51,51,52,54,55,58,60,60,62,65,67,71,77,81)
disease <- c(rep(0,9),1,0,0,1,0,0,0,1,0,1,0,1,0,0,1,1,1,0,rep(1,6))
df <- data.frame(age,disease)
plot(df$age, df$disease, col=df$disease+2, pch=16,cex=2,
     xlab = "나이", ylab = "질병유무")

group <- 1:7
group.size <- c(5,6,7,7,5,2,1) #그룹 내 사람의 수
disease.size <- c(0,1,2,4,4,2,1) #그룹 내 질병자의 수
disease.ratio <- disease.size/group.size
plot(group,disease.ratio,pch=16,cex=2,xlab = "나이그룹", ylab = "질병보유율(%)")
abline(lm(disease.ratio ~ group), col="red", lwd=2)
curve(1/(1+exp(-x+3.7)), 0, 8, add=T, col="blue", lwd=2)

# 경사하강법을 이용하여 로지스틱 회귀모델을 만들어라. 단, 초기치 w = 0 이고, a = 0.2 이다.
set.seed(11)
x3 <- c(runif(20,0,6), runif(20,5,9)) %>% round(2)
y3.1 <- rep(c(0,1),each=20)
df <- data.frame(x3,y3.1)
df <- df[sample(1:40,40),]
row.names(df) <- 1:40

model4 <- glm(y3.1 ~ x3, family = "binomial")

x3.1 <- as.matrix(cbind(1, x3))
y3.1 <- as.matrix(y3.1)
n3 <- length(y3.1)

alpha <- 0.2
num_iters <- 1000000

cost_history.3 <- double(num_iters)
w_history.3 <- list(num_iters)
w3.1 <- matrix(c(0, 0), nrow = 2)

for (i in 1:num_iters) {
  grad <- t(x3.1) %*% (1 / (1 + exp(-x3.1 %*% w3.1)) - y3.1) / n3
  w3.1 <- w3.1 - alpha * grad
  cost_history.3[i] <- cost(x3.1, y3.1, w3.1)
  w_history.3[[i]] <- w3.1
}

w3.1 %>% print
model4$coefficients


# 과제 2
mtcars <- mtcars

x4.1 <- cbind(1, mtcars$mpg, mtcars$cyl, mtcars$wt) %>% as.matrix
x4.1
y4.1 <- mtcars$vs %>% as.matrix
y4.1
n4 <- length(y4.1)
n4

model5 <- glm(mtcars$vs ~ mtcars$mpg + mtcars$cyl + mtcars$wt, family = "binomial")

alpha <- 0.01
num_iters <- 100000

cost_history.4 <- double(num_iters)
w_history.4 <- list(num_iters)
w4.1 <- matrix(c(8, 1, -1, 3), nrow = 4)

for (i in 1:num_iters) {
  grad <- t(x4.1) %*% (1 / (1 + exp(-x4.1 %*% w4.1)) - y4.1) / n4
  w4.1 <- w4.1 - alpha * grad
  cost_history.4[i] <- cost(x4.1, y4.1, w4.1)
  w_history.4[[i]] <- w4.1
}

w4.1 %>% print
model5$coefficients

install.packages("caret")
library(caret)


data <- predict.glm(model5, newdata = x4.1 %>% as.data.frame())

data

real.value <- y4.1 %>% as.factor
real.value
result <- ifelse(data > 0.5, 1, 0) %>% as.factor()
result
confusionMatrix(result, real.value)

perceptron <- function(x1, x2, w1, w2, b) {
  if(w1*x1 + w2*x2 + b <= 0) {
    return(0)
  } else {
    return(1)
  }
}
AND <- function(x1, x2) {
  return(perceptron(x1, x2, 0.5, 0.5, -0.7))
}
AND(0,0); AND(0,1); AND(1,0); AND(1,1)



#NOR
perceptron <- function(x1, x2, w1, w2, b) {
  if(w1*x1 + w2*x2 + b <= 0) {
    return(0)
  } else {
    return(1)
  }
}
NOR <- function(x1, x2) {
  return(perceptron(x1, x2, -0.5, -0.5, 0.2))
}
NOR(0,0); NOR(0,1); NOR(1,0); NOR(1,1)