# R 시작하기

print("hello, World!")
print("Welcome")

print("hello, World!"); print("Welcome")

# print("hello, World!"); print("Welcome")

print("Welcome"); 1+1
print("Welcome"); # 1+1

print("Welcome") # print()는 ()의 결과를 출력하는 함수구나....!!

help(print)
?print
?sum
?max
?min
?mean

example(sum)

install.packages("ggplot2")
update.packages("ggplot2")
library(ggplot2)

??ggplot2

# object : 메모리에 올라가는 모든 것

# 데이터 타입

# 변수이름 규칙
a <- 1
A <- 2   # a와 A는 서로 다른 변수임. 즉, R에서는 대/소문자를 구분함.
b <- c(3,4)
a1 <- c(1:10)
b.1 <- rep(3,5) #repeat 5 times

# 변수이름 규칙에 어긋나는 상황들
2a <- 3
.2 <- c(9,6)
a-b <- 3

# 변수값 할당 연산자 <-, =
x <- c(1,2,3)
y = c(4,5,6)

sum(x)
sum(y)

mean(x.1 <- c(1,2,3)) # x.1을 선언, 내부에 1, 2, 3에 대한 Vec 생성, 이후 평균을 출력해줌
x.1

ls() # 메모리에 생성된 모든 객체를 보는 함수

rm(a)  # 객체 a를 메모리에서 지워라.
rm(b,x)
rm(list=ls())  # 모두 지워라.
why? list라는 것이 Func rm에서, 지우고자 하는 목록으로 정의
그리고 그것을 ls()로 정의 하였으므로,

# 스칼라 : 1차원 값
a <- 3
b <- 4.5
c <- 3/5
print(a)
a

english <- 80
math <- 90
korean <- NA    # NA는 대문자이어야 함. NA는 Not Availalbe의 약자임

is.na(english)
is.na(math)
is.na(korean)

science <- NULL
is.na(science)
is.null(science)    #  NULL은 대문자이어야 함. NA와 NULL의 차이를 알아두어야함
sciecne <- 70

d <- "hello"
e <- 'hello'
print(d)
e
nchar(d) #char 개수
f <- substr(d, 1, 3) #d변수의 1~3까지 데이터 입력
g <- substr(d, 4, nchar(d)) #d변수의 4~5까지 데이터 입력
paste(f, g, sep=" T.T ") #seperate T.T로 분리해서 합치는 것
paste(f, g, sep="")
paste(f, g, "World!", sep=" ") #f,g, World와 합치는 것

a*2+b-c/a
17 %% 5 # 나머지
17 %/% 5 # 몫

h <- "1"    #    f라는 객체에 "1"이라는 문자를 할당
h+1       #    문자 더하기 숫자는 에러

1+1
"1"+1

# 논리 값 (logic)
T 
TRUE    #  TRUE는 숫자로 표현하면 1, FALSE는 0임
true

F
FALSE

TRUE*TRUE
T*F
F*F

1 > 2
1 == 5/5
3 != 6/2

T <- 5; F <- 7    # 에러가 발생하지는 않지만, 되도록이면 이러한 표현은 삼가한다.
rm(T, F)

# 논리 연산
TRUE && TRUE          # &&는 AND 연산자라고 부름
(1 < 2) && (1 < 3)

TRUE && FALSE
(1 < 2) && (1 > 3)

FALSE && FALSE
(1 > 2) && (1 > 3)

TRUE || TRUE          # ||는 OR 연산자라고 부름
(1 < 2) || (1 < 3)

TRUE || FALSE
(1 < 2) || (1 > 3)

FALSE || FALSE
(1 > 2) || (1 > 3)

is.na(korean) || d!="hello"

TRUE && FALSE || FALSE
TRUE || FALSE && FALSE         # &&가 || 보다 우선권을 가짐!!

(TRUE || FALSE) && FALSE         # 괄호를 먼저 계산함!!
((1 < 2) || (1 > 3)) && is.na(english)

TRUE && TRUE || FALSE && FALSE
TRUE && (TRUE || FALSE) && FALSE


# 요소 값 (Factor) - Level! With / n Levels

James.gender <- factor("m" , c("m", "f"))
Judy.gender <- factor("f" , c("m", "f"))
gildon.gender <- factor("1", c("1" , "0"))

nlevels(James.gender)
levels(Judy.gender)

James.grade <- factor("1", c("1", "2", "3", "4"))
Judy.grade <- factor("2", c("1", "2", "3", "4"))

# 에러. Why? 각 객체가 숫자가 아님. 숫자가 들어간다고 숫자가 아님. 
# definition이 문자열이므로
James.grade + Judy.grade

levels(James.grade) <- c("freshmen", "sophomore", "junior", "senior") 

# factor의 Level을 변경, 추가로 기존 데이터를 상응되는 Index에 맞춰줌
James.grade
Judy.grade

# 벡터 <Vector> : 스칼라 또는 문자를 모아놓은 것.
# = 배열 (Array)

v <- c(1, 3, 5, 6)  # 벡터를 생성하기 위해서는 c() 사용.
w <- c("a", "b", "c", "d")

names(v) <- w # names()는 벡터의 각 요소에 이름을 생성.
v
names(v) <- NULL
v
names(v) <- c("a", "b", "c") #recycling 적용 안되며, <NA>로 저장
v
names(v) <- NULL

# 벡터의 접근

v <- c(4, 5, 23, 5, 6, 7, 8, 9, 4, 2)
v[1]
v[-1]
v[2:4]
v[-(2:4)]
v[c(5, 7)]
v[-c(5, 7)]
#Only Matrix, result -> Error
v[5, 7]
v[v > 7]
length(v)
v[length(v) - 2]
max(v)
min(v)
which.max(v)
v[which.max(v)] == max(v)

# 벡터의 연산

u <- c(1, 2, 3, 4, 5)
w <- c(1, 4, 6, 9, 11)

u + w
u + 1
w - u
10 - w
u + c(1, 2, 7)  # recyling rule in R (중요 ◆◆◆◆◆◆◆◆◆◆)

7 * u
u * w  # 각 요소 끼리 곱
u %*% w  # 벡터 내적 (inner product) == sum(u * w)
w / 10
10 / w
u / w

sum(u)        # 합
mean(u)       # 평균
var(u)        # 분산
sqrt(var(u))  # 표준편차
sd(u)         # 표준편차

indentical(u, w)    # 전체를 비교, 같은 벡터인가?
u == w              # 벡터 각 요소별로 비교
all(u == w)         # indentical(u, w) 와 같은 결과임, all(u == w) 라고 쓰기.

intersect(u, w)   # 교집합
union(u, w)       # 합집합
setdiff(u, w)     # 차집합
setdiff(w, u)

4 %in% u    # 4가 벡터 u의 요소인지 판별

(4 %in% u) && (4 %in% w) # 4가 벡터 u와 벡터 w의 요소인가?
4 %in% intersect(u, w)

# 2가 벡터 u의 요소이고, 벡터 w의 요소는 아닌가? (= 차집합)


# 벡터 쉽게 생성하기.

rm(list=ls())

u <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
w <- 1:20
#Integer == Numeric
all(u == w)

x <- seq(1, 10)    # 등차수열 seq(처음 숫자, 마지막 숫자, 공차)
y <- seq(1, 10, 0.5)  # 1 ~ 10까지 0.5의 공차를 가진 등차수열
y.1 <- seq(1, 12, 5)

z.1 <- rep(2, 5)
z.2 <- rep(seq(1, 3), times = 3)        # times = 전체반복횟수
z.3 <- rep(seq(1, 3), each = 3)         # each = 각 항목 반복 횟수
z.4 <- rep(seq(1, 3), each = 3, times = 2)

letters         # a ~ z 출력
LETTERS         # A ~ Z 출력
letters[2:5]    # b ~ e 출력

append(c(1, 2), c(3, 4)) # = c(c(1, 2), c(3, 4))

# 1 부터 10까지 공차가 1인 수열 중에서 5보다 작고 8보다 큰 벡터를 만드시오

x <- seq(1, 10, 1) # 1:10
x[x < 5]
x[x > 8]
append(x[x < 5], x[x > 8])

# 1 부터 10968 까지 자연수 중에서 3의 배수인 수들의 평균과 표준편차를 구하시오

n <- seq(1:10968)
m <- n[(n %% 3) == 0]
mean(m)
sd(m)

# 리스트 : 스칼라 또는 문자를 혼합해서 모아놓은 것
# List == Structure??
# Variable, Function in List +) Name

James.info <- list(name="James", height=188, weight=80, hometown="Seoul")
Judy.info <- list(name="Judy", height=165, weight=51, hometown="Seoul")

James.info
Judy.info

# $ == 소유격
James.info$name
James.info$height
James.info$weight
James.info$hometown

# Field Access
James.info[1]
James.info$hometown == Judy.info$hometown

# 리스트 중첩
James.score <- list(exam = list(mid=90, final=80, grading="B+"))
Judy.score <- list(exam = list(mid=95, final=90, grading="A0"))

James <- append(James.info, James.score)
Judy <- append(Judy.info, Judy.score)

James$exam$mid
James$exam$final

James.points <- James$exam$mid + James$exam$final  #  90+80=170
Judy.points <-Judy$exam$mid + Judy$exam$final      #  95+90=185

# James와 Judy 중 시험점수 합계(중간+기말)가 높은 사람은 누구인가?
c("James","Judy")[which.max(c(James.points,Judy.points))]

# 행렬 만들기, matrix 숫자, 문자 행렬 가로 카테고리 행, 세로 카테고리 열
rm(list=ls()) 
gc()
# 데이터는 항상 세로 방향으로 들어간다는 것을 인지해라
m <- matrix(c(1:8), nrow = 2) 행
m.1 <- matrix(c(1:8), ncol = 2) 열 설정, 

# 데이터 가로 입력 설정
m.2 <- matrix(c(1:8), nrow = 2, byrow=T) 
m.3 <- matrix(c(1:8), ncol = 2, byrow=T)

m.4 <- matrix(c(1:10), nrow=4)   # recycling rule!! +2
m.5 <- matrix(c(1:10), nrow=4, byrow=T)
m.6 <- matrix(c(1:10), nrow=4, ncol=2, byrow=T) #Dimension을 잘라냄

m.8 <- matrix(, nrow=4, ncol=4)  # null matrix, NA
m.8[1, 1] <- 1
I <- diag(4)                   # Diagonal(대각선), identity matrix (단위행렬)
J <- diag(3,4)                # 대각선 요소가 3인 4x4 대각행렬, Value 3 지정
# 항상 행, 열 크기가 같다. <- 당연한 것.

# 벡터를 이용한 행렬 만들기
m <- rbind(c(1,5,6), c(8,4,78)) # row bind (Default = byrow = T)
m <- rbind(m, c(2,87,5))

n <- cbind(c(1,5,6), c(8,4,78)) # column bind (Generally bind...)
n <- cbind(n, c(2,87,5))

rbind(m,n)
cbind(n,m)

# 행렬 데이터 접근
m <- matrix(seq(1:16), nrow = 4, byrow=T)
m[2, 3]
m[-2, 3]
m[2,- 3]
m[2:3, 1]
m[2:3, -1]
m[-(2:3), 3:4]
m[2,]
m[,2]
m[-2,]
m[,-2]
m[m <= 5]

# m행렬 요소중 5 이하인 요소는 몇개인가?
length(m[m <= 5])

max(m)
which(m >= 10, arr.ind = TRUE)

# m행렬 요소중 가장 큰 수자는 몇번째 요소인가? (행번호 및 열번호)
which(m == max(m), arr.ind = TRUE)

m[1,2] <- 7
m[1,2:3] <- c(100,200)

# 행렬 연산

m <- matrix(c(1:4), byrow=T, ncol=2)
n <- matrix(c(1,1,0,1), byrow=T, ncol=2)

m + n
m - n
m * n   # 각 요소끼리 곱
m %*% n   # 행렬의 곱
n/m   # 각 요소끼리 나누기

nrow(m)
ncol(m)
rowSums(m)     # 행 합
rowMeans(m)    # 행 평균
colSums(m)     # 열 합
colMeans(m)    # 열 평균

det(m) # Determinant Operator
t(m)   # t() 전치행렬(transpose matrix)를 구함 
solve(m)   # solve() 역행렬을 구함

m %*% solve(m)
solve(2)

dim(m)   # 행렬의 차원

# 데이터 프레임, 리스트
df <- data.frame(name = c("James", "Judy", "Donald"),
                 gender = c("M","F", "M"),
                 hometown = c("Seoul", "Samcheok", "New York"),
                 mid = c(90, 95, 60),
                 final = c(80, 90, 50),
                 grades = c("B+", "A0", "F"), stringsAsFactors = FALSE)
df
View(df)
str(df)
names(df)
names(df)[1] <- "First name"
names(df) <- NULL
df

df$name
df$grades[2]

# 데이터 프레임에 기존에 없던 열 추가
hw <- c(100, 90, 70)
df$homework <- hw
df

# 데이터 프레임 접근
df$final[2] <- 95
df.1 <- df[c(1,3), ]
df.2 <- df[, c("First name", "mid", "final", "homework", "grades")]
df.3 <- df[, -c(2:3)]

df.2 == df.3

df.2[2 ,c("First name","grades")]
df.2[2 ,c(1,5)]

# df에 각 학생의 중간/기말 성적의 평균을 나타내는 열을 추가하라. 열의 이름은 avg로 하시오.
df$avg <- rowMeans(df[, c("mid", "final")])


# 데이터 프레임 합치기
rm(list=ls())
df.1 <- data.frame(name = c("James", "Judy", "Donald"),
                   gender = c("M","F", "M"),
                   hometown = c("Seoul", "Samcheok", "New York"),
                   mid = c(90, 95, 60),
                   final = c(80, 90, 50),
                   grades = c("B+", "A0", "F"), stringsAsFactors = FALSE)
df.2 <- data.frame(name = c("Lee", "Emma"),
                   gender = c("M","F"),
                   hometown = c("Seoul", "LA"),
                   mid = c(70, 95),
                   final = c(75, 78),
                   grades = c("C+", "B+"), stringsAsFactors = FALSE)

df.3 <- rbind.data.frame(df.1, df.2)
df.3 <- rbind.data.frame(df.3, df.3)
# cbind.data.frame도 존재하지만, field끼리 합칠 때 사용

head(df.3) #초기 6개의 데이터만 출력한다.
head(df.3, 3) #

tail(df.3)
tail(df.3, 4)

# 타입 판별
a <- c(1,2,3,4,5)
class(a)
is.numeric(a)
is.factor(a)
is.character(a)
is.matrix(a)

class(df.3) #data type 출력!
is.data.frame(df.3)

# 타입 변환
x <- c("a", "b", "c")
class(x) #character

x <- as.factor(x) #type 변환, 
x
class(x) #factor

x <- as.character(x) #type casting to character vector
x

m <- matrix(c(1:9), ncol=3)
m
class(m)

m <- as.data.frame(m) #field => V1, V2, V3, ...
m

m <- as.matrix(m) #field => data frame의 field를 그대로 가져옴!
m
colnames(m) <- NULL #열 이름을 지워라!
m

df.3
str(df.3) #구조열, data.frame에서 무조건 해봐야함 출력되는 type을 너무 믿지 마라
df.3$gender <- as.factor(df.3$gender)
# str(df.3)을 통해서 factor임을 확인해라!

df.3$gender <- as.character(df.3$gender)
str(df.3)

# 조건문
if(1 == 2/2) {
  print("true")
  print("Hello World!")
} else {
  print("false")
  print("welcome")
}

if(1 == 3/2) {
  print("true")
  print("Hello World!")
} else {
  print("false")
  print("welcome")
}

x <- "1"
if(is.numeric(x)) {
  print(x + 1)
} else if(is.factor(x)){
  print(as.numeric(x) + 2)
} else {
  print(as.numeric(x) + 3)
}

# 객체 y에 저장된 문자가 소문자면 대문자로 바꿔라.
y <- "e"

asc <- function(x) strtoi(charToRaw(x), 16L)
asc(y)
asc("a")
asc("z")
asc("e")
asc("E")

if(asc("a") <= asc(y) && asc(y) <= asc("z")) y <- toupper(y)

if(y %in% letters) y <- toupper(y)

x <- "1"
if(is.numeric(x)) {
  print(x + 1)
} else {
  print(as.numeric(x) + 2)
}

# else 와 else if 는 선택사항.(즉, 필요할 때만 씀)
if(is.numeric(x)) {
  print(x + 1)
}

if(is.numeric(x)) print(x + 1)

# ifelse 조건문
x <- 1:6
ifelse(x %% 2 != 0, "odd", "even")
ifelse(1:length(letters) %% 2 == 1, letters, LETTERS)

df.1 <- data.frame(name = c("James", "Judy", "Donald"),
                   gender = c("M","F", "M"),
                   hometown = c("Seoul", "Samcheok", "New York"),
                   mid = c(90, 95, 60),
                   final = c(80, 90, 50),
                   grades = c("B+", "A0", "F"), stringsAsFactors = FALSE)
df.2 <- data.frame(name = c("Lee", "Emma"),
                   gender = c("M","F"),
                   hometown = c("Seoul", "LA"),
                   mid = c(70, 95),
                   final = c(75, 78),
                   grades = c("C+", "B+"), stringsAsFactors = FALSE)

df <- rbind.data.frame(df.1, df.2)
str(df)
rm(df.1, df.2); gc()

# 세번째 학생이 남자면 그 학생의 기말시험 점수를 알고 싶다.
if(df$gender[3]=="M") print(df$final[3])

# 두번째 학생의 고향이 서울이면 그 학생의 기말시험 점수를 알고 싶다.
# 그렇지 않으면 그 학생의 중간시험과 기말시험 점수와 평균을를 출력하고 싶다.
if(df$hometown[2]=="Seoul") {
  print(df$final[2])
} else {
  df.exam <- df[2, c("mid", "final")] #mid, final 추출!
  df.exam$avg <- rowMeans(df.exam)
  print(df.exam)
}

# 두번째 학생의 기말시험 점수가 6점 올랐다.
# 성적평가 정책상 중간/기말 평균이 95점 이상이면 A+를 준다.
# df를 수정하라.
df
df[2,"final"] <- df[2,"final"] + 6
df
exam.avg.2 <- rowMeans(df[2,c("mid","final")])
if(exam.avg.2 > 95) df[2,"grades"] <- "A+"
df

# ifelse 조건문
x <- c(1:6)
ifelse(x %% 2 != 0, "odd", "even")
#if와 else를 합친 것? ifelse (조건, True, False)

# gender 컬럼이 팩터형이 아니면, 팩터형으로 변환하라.
str(df)
ifelse(is.factor(df$gender), Sys.sleep(0), df$gender <- as.factor(df$gender))
str(df)

# 반복문 (for, while, repeat!!) repeat는 rep랑 다름!
자체적으로 1~10까지 Vector를 만들어 버린다.
seq(1, 10, 2) 1, 3, 5, 7, 9
for(i in 1:10) {
  print(i)
}

i <- 1
while(i <= 10) {
  print(i)
  i <- i + 1
}

#repeat는 rep랑 다르다! 무한 반복문(repeat) + break

i <- 1
repeat {
  print(i)
  if(i < 10) {
    i <- i + 1
  } else break
}

# 350 부터 489500 까지 자연수 중 7의 배수를 모두 구하라.

for(i in 350:489500) {
  if(i %% 7 == 0) print(i)
}

x <- 350:489500
x[x %% 7 == 0]

# 위의 두 코드는 같은 의미의 코드이다.
# for문의 직렬적 코드가 실행시간을 길게 만듬

system.time(
  for(i in 350:489500) {
    if(i %% 7 == 0) print(i)
  }
)

system.time(print(x[x %% 7 == 0]))
rm(x); gc()

# 되도록 반복문(for, while, repeat)의 사용을 피할 것! 
# 어쩔 수 없이 사용해야 된다면 그 때 사용할 것!

# 1 부터 12 까지 자연수 중 3의 배수의 평균을 구하라.
x <- rep(0, 12) #allocation
for(i in 1:12) {
  if(i %% 3 == 0) x[i] <- i
}
x <- x[x != 0]
mean(x)

x <- 1:12
x <- x[x %% 3 == 0]
mean(x)

# 수학연산
# 사칙연산 모두 가능 (+, -, *, /)
# n %% m  => n을 m으로 나눈 나머지
# n %/% m  => n을 m으로 나눈 몫
# n^m  => n의 m제곱
# exp(n)  => 자연대수 e의 n제곱 e^1=2.718....
# log(m, base=n)  => 밑이 n인 로그, 만약 base를 지정하지 않으면 밑이 e인 자연로그
log(9, 3) == log(9, base=3)
log(9) # <- 자연로그 9, ln 9
log(9, exp(1)) == log(9, base=exp(1)) == ln 9
log(exp(1)) == ln e == 1

# log2(n)  => 밑이 2인 로그
log2(4)

# log10(n)  => 상용 로그
log10(1000)

# sin(x), cos(x), tan(x)
sin(pi/2); cos(2*pi); tan(pi/4) == 1

# hyperbolic tangent
# 활성함수로 사용, 쌍곡선 함수
tanh(pi)

# 괄호 연산
(1:5*2)+1 <= 3, 5, 7, 9, 11
1:(5*2)+1 == 1:10 + 1
1:(5*2+1) == 1:11
1:5*(2+1) == 3, 6, 9, 12, 15 #!!! 헷갈림
x <- exp(1:5*(2+1)) x == e^3, e^6, ...
log(x) == ln e^3, ln e^6, ...

x <- append(seq(1, 100, 3), seq(1, 100, 4)) <- 순차적으로 합침
sum(x); mean(x); var(x)(분산), sd(x) 표편,  median(x) 중앙값

#length.out <- Dynamic 공차, But, 원소의 개수를 정할 수 있다.
x <- c(seq(1, 100, 3), seq(1, 100, length.out =  10))

#합, 평균, 분산, 중앙값
sum(x); mean(x); var(x); median(x)

# NA(Not Available) 처리
NA && TRUE #Just NA
NA + 1
x <- c(1, 2, 3, NA)
sum(x)
sum(x, na.rm = TRUE) #<- na 제외하고 더한다.. 제거가 아님
mean(x, na.rm = TRUE)
var(x, na.rm = TRUE)
median(x, na.rm = TRUE)
x <- as.numeric(na.omit(x)) 
#<= NA를 Vector내에서 제거하고, Numeric으로 x에 다시 넣어라!
x
class(x)

rm(list=ls())

# 함수 (매우 중요!!)

# f(x) = x + 1 을 고려해보자.
f <- function(x) {
  y <- x + 1          # y라는 객체는 f라는 함수에만 정의. 메모리에 생성되지 않음
  return(y)
}
f(1)

g <- function(x) return(x^2)
g(4)

# h(x) = x + y 을 고려해보자. x와 y를 출력하고, x+y와 x-y를 반환하는 함수를 만들어라.
h <- function(x, y) {
  print(paste("x =",x)) #변수 x값 강제 문자로 변환!
  print(paste("y =",y))
  print(paste("x + y =",x+y))
  print(paste("x - y =",x-y)) <- no Return, Just Print
}
h(10,10) #4출력

j <- function(x, y, z=1) x+y+z     # 인자 지정 전달 (z=1), 사전 인수 값!
j(2, 3)
j(2, 3, 7) <- 2, 3, 7 전달
j(2, 4)

j1 <- function(x, y, z=-x-y) x+y+z     # 인자 지정 전달 (z=-x-y), 들어올 때 계산
j1(464, 18) == 0

j2 <- function() sum(1:100) #인자 없는 함수
j2()

j3 <- function()
{
  print("hello")
  print("world")
}

# d라는 함수는 3차원 좌표평면의 어느 점에서 원점까지 거리를 계산하는 함수이다.
# d라는 함수를 구현하고, 원점에서 부터 점(3,4,5)의 거리를 구하라. (HW)

# 이름, 고향, 중간, 기말을 입력받아 기말/중간 평균 점수가 60점 이상이면 Pass,
# 이하이면 Fail을 반환하는 함수를 만들어라. (HW)

# 중첩함수
f <- function(x, y) {
  x <- x + 5
  g <- function(y, z = 7) return(y + z)
  return(c(x, g(y)))
}
f(15, 3)

# 스코프
n <- 100             # 전역변수 n 선언
f <- function() {
  print(n)
}
f()

f.1 <- function() {
  n <- 1             # 지역변수 n 선언
  print(n)        
}
f.1()               # 함수내부의 지역변수 n이 전역변수 n보다 우선한다.

f.2 <- function(n) {
  print(n)        
}
f.2(1)               # 함수인자의 지역변수 n은 전역변수 n보다 우선순위를 가진다!!

f.3 <- function(x) {
  a <- 2
  g <- function(y) { #지역함수이므로 실제 선언은 되지 않는다!
    print(y + a)
  }
  g(x)
}
f.3(1)
#pi에 대한 함수 문제가 나온다.
#pi의 소수점 n번째까지 구하는 함수를 작성하시오.
ex) pi <- function(n) , usage) pi(2) ==> 3.14 +) 소수인지 아닌지 구하시오.
output <- function(n)
{
  result <- pi %/% (10 ^ -n)
  return(result / 10 ^ n)
} 
#pi constant에 의해 6자리까지만 정상적으로 출력됨, 실제 시험에서는 pi를 구해야할 것

# 재귀함수
factorial(3)

# n! = n * (n-1) * (n-2) * ... * 2 * 1 = n * (n-1)!
# 0! = 1, 1! = 1

my.factorial <- function(n) {
  if(n == 1 || n == 0) {
    return(1)
  } else {
    return(n * my.factorial(n-1))
  }
}
my.factorial(4)
factorial(4)

# 피보나치 수열
# 0, 1, 1, 2, 3, 5, 8, 13, 21, ....

# fibo(n) = fibo(n-1) + fibo(n-2)

fibo <- function(n) {
  if(n <= 2) {
    return(n-1)
  } else {
    return(fibo(n-1) + fibo(n-2))
  }
}
fibo(1); fibo(2); fibo(5); fibo(21)

# 재귀함수를 이용한 무한루프

repeat {
  print("hello")
}

foo <- function() {
  print("hello")
  foo()
}
foo()

rm(list=ls()); gc()

# 파이프 (pipe) 
install.packages("dplyr")
library(dplyr)
f <- function(x) x^2
f(2)
2 %>% f

g <- function(y) y+1
g(f(2))
2 %>% f %>% g

x <- letters
length(x)
x %>% length() # x %>% length

asc <- function(x) 
  strtoi(charToRaw(x), 16L) # 문자를 아스키코드로 변환하는 함수

x <- c(5,2,1,9,0)
x %>% 
  max %>% 
  g %>% 
  f %>% 
  as.character %>% 
  asc %>%
  sum


