# nnet 패키지를 이용한 수치예측
library(nnet)
library(caret)

a <- rep(1:10, times=10)
b <- rep(1:10, each=10)
IQ150 <- cbind.data.frame(a,b,c=a*b+b-(a-b))

# 훈련데이터/검증데이터 분리
set.seed(123)
#samp <- 1:nrow(IQ150) %>% sample(., 80)
samp <- createDataPartition(IQ150$c, p=0.8, list = F)
train.data <- IQ150[samp,]
test.data <- IQ150[-samp,]

# 입력변수, 출력변수 지정 학습
nn1.1 <- nnet(train.data[,-3],   # 입력변수
              train.data[,3],    # 출력변수
              size=4,            # 은닉노드수
              maxit=1000,        # 최대 iteration
              decay = 5e-4,      # overfitting을 피하기 위해 사용하는 weight decay parameter
              linout=TRUE        # 수치예측이면 TRUE, 분류문제이면 FALSE
                                 # batch size is 32, mini-batch gradient, Optimizer is BFGS(in use logistic)
                                 # Sigmoid Activation Function! <- single Layer 
) 
nn1.1
summary(nn1.1)

source("LNML\plotnnet.txt")
plot.nnet(nn1.1)

cbind.data.frame(test.data, 예측=predict(nn1.1, test.data[,-3]))

# 포뮬라 사용 학습
nn1.2 <- nnet(c ~ a + b,         # formula c ~ .
              data = train.data, # 훈련데이터
              size=4,            
              maxit=1000,        
              decay = 5e-4,      
              linout=TRUE        
)
cbind.data.frame(test.data, 예측=predict(nn1.2, test.data[,-3]))

# 은닉노드 수 증가 (4개 -> 20개)
nn1.3 <- nnet(c ~ a + b,         # formula c ~ .
              data = train.data, # 훈련데이터
              size=20,           # 은닉노드수
              maxit=1000,        # 최대 iteration
              decay = 5e-4,      # overfitting을 피하기 위해 사용하는 weight decay parameter
              linout=TRUE        # 수치예측이면 TRUE, 분류문제이면 FALSE
)
cbind.data.frame(test.data, 예측=predict(nn1.3, test.data[,-3]))

# nnet 패키지를 이용한 분류
# iris 분류
iris <- iris
set.seed(123)
samp <- createDataPartition(iris$Species, p=0.7, list = F)

iris.train <- iris[samp,]
iris.test <- iris[-samp,]
nn2 <- nnet(Species ~ .,
            data =  iris.train,
            size = 6,
            maxit=1000,
            decay = 5e-4,
            rang=0.1, #initial Weight value is range(-0.1, 0,1)
            linout=FALSE
)

#분류 문제이므로 Class == Classification을 선택한 것.
cbind.data.frame(iris.test, 예측=predict(nn2, iris.test[,-5], type="class"))

real.value <- iris.test$Species
pred.value <- predict(nn2, iris.test[,-5], type="class") %>% as.factor

confusionMatrix(pred.value, real.value)

# 로지스틱와 회귀비교
set.seed(11)
x <- c(runif(20,0,6), runif(20,5,9)) %>% round(2)
y <- rep(c(0,1),each=20) %>% as.factor
df <- data.frame(x,y)
df <- df[sample(1:40,40),]
row.names(df) <- 1:40

nn3 <- nnet(y ~ x, data =  df, size = 100,
            maxit=1000, decay = 5e-4)

cbind.data.frame(df, 예측=predict(nn3, df[,-2], type="class"))

real.value <- df$y
pred.value <- predict(nn3, df[,-2], type="class") %>% as.factor

confusionMatrix(pred.value, real.value)
