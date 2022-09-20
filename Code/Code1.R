#exam 1
#Function Define
exam1 <- function(a)
{
  sqrt((-2.7)^2 + (a - 0.5)^2 + (1.2)^2) - sqrt((3.3)^2 + (a - 2.5)^2)
}

#Find Value
result1 <- uniroot(exam1, lower = 2, upper = 3)$root
print(result1)

#exam 2
#combination Function Define
combination <- function(n, r)
{
  factorial(n) / (factorial(r) * factorial(n-r))
}
#흰 공 3개, 검은 공 4개에서 각 공 2개를 임의 추출하는 확률이므로, 3C2 * 4C2 / 7C4가 된다.
result2 <- combination(3, 2) * combination(4, 2) / combination(7, 4)
print(result2)

#exam 3
#문제의 정적분 함수 정의
formula1 <- function(x)
{
  (log(x) - 1) / x^2
}
#Integrate 함수를 사용해서 e^2부터 e까지의 적분 실행
result3 <- integrate(formula1, lower = exp(1), upper = exp(2))$value
print(result3)

#exam 4
#combination Function Define
combination <- function(n, r)
{
  factorial(n) / (factorial(r)*factorial(n-r))
}
#a + b + c' = 9 - 2d에 따라, d = 0, d = 1, d = 2, d = 3, d = 4의 확률을 구한다.
#c' <= 0
result4 <- 0
for(i in seq(1, 9, 2))
{
  result4 <- result4 + print(combination(i + 2, i))
}
print(result4)

#exam 5
#combination Function Define
combination <- function(n, r)
{
  factorial(n) / (factorial(r)*factorial(n-r))
}
#모든 경우의 수를 더하고, 연속되지 않는 경우를 뺌으로 확률을 구하였다.
coin <- function(n)
{
  calc_result <- 0
  calc_result <- calc_result + combination(7, n) #7C3, 7C4, 7C5, 7C6, 7C7
  if(n == 3) #4H2
  {
    calc_result <- calc_result - combination(5, n) #앞면이 3번 나왔을 경우의 불연속 앞면 배치 경우의 수, 5C2 == 5C3
  }
  else if(n == 4)
  {
    calc_result <- calc_result - combination(4, 4) #앞면이 4번 나왔을 경우의 F,B,F,B,F,B,F (불연속 앞면 배치)
  }
  print(calc_result)
}

result5 <- 0
for(i in 3:7)
{
  result5 <- result5 + coin(i)
}
result5 <- result5 / 2^7
print(result5)

#exam 6
#정규 분포 공식 x, m = mean, o = 표준편차
pro_distribute <- function(x, m, o)
{
  (2 * sqrt(2*pi))^-1 * exp(-(x-m)^2 * (2*(o)^2)^-1)
}

#계산 후의 정규분포 식 이를 기반으로 답을 구한다.
result_distribute <- function(x)
{
  (2 * sqrt(2*pi))^-1 * exp(-(x-22)^2 * (2*(2)^2)^-1)
}

calc6 <- function(y, z, y_prob1, y_prob2) #x <= y, z == 표준편차
{
  #예상되는 m의 범위
  y_data1 <- y - z
  y_data2 <- y + z
  
  #f(12) <= g(20)이므로 f(12)와 g(20)의 그래프를 그려서 범위 내 최대 값을 구한다.
  curve(pro_distribute(x, 10, 2), xlim = c(5, 30), lty = 1, type = "l")
  curve(pro_distribute(x, 12, 2), xlim = c(5, 30), col = "green" , lty = 1, type = "l", add = TRUE)
  
  curve(pro_distribute(x, 20, 2),lty = 1, type = "l", add = TRUE)
  
  abline(v = y_prob1)
  abline(v = y_prob2) #maximum m  <- (y_prob1 + y_prob2 ) / 2  == 22.5
  curve(pro_distribute(x, 22, 2), col = "red" , lty = 1, type = "l", add = TRUE)
  
  #curve(result_distribute, xlim = c(15, 30), col = "red" , lty = 1, type = "l")
  
  #abline(v = y_data2 - z , col = "red")
  #abline(v = y_data2 + z, col = "red") #m range check 
  
  snd1 <- (y_prob1 - y_data2) / z
  snd2 <- (y_prob2 - y_data2) / z
  
  m_range <- y_data1
  m_range %<>% append(y_data2)
  print(m_range)
  snd_result <- snd1
  snd_result %<>% append(snd2)
  
  print(snd_result)
}

calc6(20, 2, 21, 24)

#최대 값 출력
result6 <- integrate(result_distribute, lower = 21, upper = 24)$value
print(result6)

#exam 7
my.graph <- function(x, n)
{
  plot(x, xlim=c(-n,n), ylim=c(-n,n), xlab="x", ylab="f(x)", lty = 1, type = 'l', col = 'red')
  abline(v=0)
  abline(h=0)
}
f <- function(x)
{
  (x^4-15*x^2-10*x+24)/10
}
my.graph(f, 10)

#exam 8
load("~/eagles.RData")

#행 개수 기반 임의 추출 -> sample_num에 저장
sample_num <- sample(1:nrow(eagles), nrow(eagles)*0.9)

#데이터 검증을 위한 Train, Test 데이터를 구분하였음
eagles.train <- eagles[sample_num, ]
eagles.test <- eagles[-sample_num, ]

#nnet 함수를 사용하여, input, output에 상응되는 데이터 학습
nnet_object <- nnet(result ~., data=eagles.train, size=20, maxit=10000)

#Test 데이터 기반으로 승부 예측을 해보았음
prepare.prediction <- predict(nnet_object, eagles.test[,-5], type = "class")

#상응되는 경기 결과들이 출력됨
print(prepare.prediction)

#해당 문제의 예측 경기 지표를 정의하였음
real.data <- data.frame(14, 1, 7, 5)
colnames(real.data)<- c("eagles.hits","eagles.booted", "rival.hits", "rival.booted")

#방금 정의한 데이터를 기반으로 경기 승/패를 예측함
result8 <- predict(nnet_object, real.data, type = "class")
print(result8)
