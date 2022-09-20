# neuralnet 패키지를 이용한 수치예측
#install.packages("neuralnet")
library(neuralnet)
library(caret)

a <- rep(1:10, times=10)
b <- rep(1:10, each=10)
IQ150 <- cbind.data.frame(a,b,c=a*b+b-(a-b))

# 훈련데이터/검증데이터 분리
set.seed(123)
samp <- createDataPartition(IQ150$c, p=0.8, list = F)
train.data <- IQ150[samp,]
test.data <- IQ150[-samp,]

# 포뮬라 사용 학습
nn2.1 <- neuralnet(c ~ a + b,              # formula c ~ .
                   data = train.data,      # 훈련데이터
                   hidden=c(4,2),          # 은닉층 2개 (4개, 2개)
                   threshold = 0.5,        # 정지조건 (비용함수 변화량이 0.5 이하면 정지)
                   stepmax = 200000,       # 최대 반복횟수 (기본은 100000회)
                   learningrate = 0.3,     # 학습률
                   err.fct = "sse",        # 비용함수 (수치예측문제면 "sse", 분류문제면 "ce, Cross Entropy")
                   act.fct = "logistic",   # 은닉층 활성함수 ("logistic", "tanh")
                   linear.output = TRUE    # 수치예측문제면 TRUE, 분류문제면 FALSE
)

plot(nn2.1)
nn2.1 %>% summary
nn2.1$weights
cbind.data.frame(test.data, 예측=compute(nn2.1,test.data)$net.result)

# 은닉노드 수 및 층 증가
nn2.2 <- neuralnet(c ~ a + b,
                   data = train.data,
                   hidden=c(10,10,10),     # 은닉층 3개 (10개, 10개, 10)
                   threshold = 0.1,        # 정지조건 (비용함수 변화량이 0.1 이하면 정지)
                   stepmax = 200000,
                   learningrate = 0.3,
                   err.fct = "sse",
                   act.fct = "logistic",
                   linear.output = TRUE 
)

plot(nn2.2)
cbind.data.frame(test.data, 예측=compute(nn2.2, test.data)$net.result)

# neuralnet 패키지를 이용한 분류
# iris 분류
iris <- iris
set.seed(123)
samp <- createDataPartition(iris$Species, p=0.7, list = F)

iris.train <- iris[samp,]
iris.test <- iris[-samp,]

nn2.3 <- neuralnet(Species ~ .,
                   data = iris.train,
                   hidden=c(2,4),  
                   threshold = 0.01,
                   stepmax = 200000,
                   learningrate = 0.1,
                   err.fct = "ce",        # 분류문제면 "ce" cross-entropy
                   act.fct = "logistic",
                   linear.output = FALSE 
)
# Classification Result의 Vector Hot-Encoding?
# 실제 Result에 맞는 Dimension에 특정 Flag(보통 0.5 보다 큰 값)를 부여함으로 출력을 할 수 있다.
plot(nn2.3)

library(dplyr)
pred <- neuralnet::compute(nn2.3,iris.test)$net.result %>% 
  apply(1,which.max) %>% 
  levels(iris$Species)[.] %>% 
  as.factor

cbind.data.frame(iris.test, 예측=pred)

real.value <- iris.test$Species
pred.value <- pred
confusionMatrix(pred.value, real.value)

# 로지스틱와 회귀비교
set.seed(11)
x <- c(runif(20,0,6), runif(20,5,9)) %>% round(2)
y <- rep(c(0,1),each=20) %>% as.factor
df <- data.frame(x,y)
df <- df[sample(1:40,40),]
row.names(df) <- 1:40

nn2.4 <- neuralnet(y ~ x, data=df,
                   #hidden=0, # 결국 로지스틱 회귀분석은 Hidden Layer가 없다는 것과 같다!
                   hidden=rep(3,3),  
                   threshold = 0.001,
                   learningrate = 0.2,
                   err.fct = "ce",
                   act.fct = "logistic",
                   linear.output = FALSE 
)

plot(nn2.4)
pred <- neuralnet::compute(nn2.4,df)$net.result %>% 
  apply(1,which.max) %>% 
  levels(df$y)[.] %>% 
  as.factor

cbind.data.frame(df, 예측=pred)

real.value <- df$y
pred.value <- pred
confusionMatrix(pred.value, real.value)
