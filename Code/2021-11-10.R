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

NAND <- function(x1, x2) {
  return(perceptron(x1, x2, -0.5, -0.5, 0.7))
}
NAND(0,0); NAND(0,1); NAND(1,0); NAND(1,1)

OR <- function(x1, x2) {
  return(perceptron(x1, x2, 0.5, 0.5, -0.2))
}
OR(0,0); OR(0,1); OR(1,0); OR(1,1)

NOR <- function(x1, x2) {
  return(perceptron(x1, x2, -0.5, -0.5, 0.2))
}
NOR(0,0)
NOR(0,1)
NOR(1,0)
NOR(1,1)

XOR <- function(x1, x2){
  return(AND(!AND(x1,x2), OR(x1, x2)))
}
XOR(0,0); XOR(0,1); XOR(1,0); XOR(1,1)

XNOR <- function(x1, x2){
  return(OR(AND(x1,x2), !OR(x1, x2)))
}
XNOR(0,0)
XNOR(0,1)
XNOR(1,0)
XNOR(1,1)

library(dplyr)

X <- matrix(c(1,0,0,
              1,0,1,
              1,1,0,
              1,1,1,
              0,0,1,
              0,1,0,
              0,1,1,
              0,0,0), byrow = T, ncol=3)
X <- cbind(1, X)
y <- c(-1,1,1,1,-1,-1,1,-1) %>% matrix
w <- rep(0, ncol(X)) %>% matrix
lambda <- 0.1

W <- t(w) %>% data.frame
names(W) <- paste0("w", 0:(length(w)-1))

repeat{
  for(i in 1:nrow(X)) {
    y.hat <- ifelse(X %*% w < 0, -1, 1)
    w <- w + lambda * (y[i] - y.hat[i]) * t(X)[,i]
    W <- rbind.data.frame(W, as.vector(w))
  }
  
  if(all(y == y.hat)) break
}

W[1:nrow(W) %% nrow(X) == 1,] %>% View

XOR.three.inputs <- function(x1,x2,x3){
  return(XOR(XOR(x1, x2), x3))
}
XOR.three.inputs(0,0,0)
XOR.three.inputs(0,0,1)
XOR.three.inputs(0,1,0)
XOR.three.inputs(0,1,1)
XOR.three.inputs(1,0,0)
XOR.three.inputs(1,0,1)
XOR.three.inputs(1,1,0)
XOR.three.inputs(1,1,1)

XOR_3Inputs <- function(x1,x2,x3){
  
  return(XOR(x1, XOR(x2, x3)))
}
XOR_3Inputs(0,0,0)
XOR_3Inputs(0,0,1)
XOR_3Inputs(0,1,0)
XOR_3Inputs(0,1,1)
XOR_3Inputs(1,0,0)
XOR_3Inputs(1,0,1)
XOR_3Inputs(1,1,0)
XOR_3Inputs(1,1,1)

df <- data.frame(t(rep(NA,3)))
for(x1 in 0:1)
  for(x2 in 0:1)
    for(x3 in 0:1) {
      df <- rbind.data.frame(df,c(x1,x2,x3))
    }
df <- df[-1,]
for(i in 1:nrow(df)){
  df$Y[i] <- XOR.three.inputs(df$X1[i], df$X2[i], df$X3[i])
}

X <- matrix(c(0,0,0,1,1,0,1,1), byrow = T, ncol=2)
X <- cbind(1, X)
y <- c(-1,1,1,-1) %>% matrix
w <- rep(0, ncol(X)) %>% matrix
lambda <- 0.1

W <- t(w) %>% data.frame
names(W) <- paste0("w", 0:(length(w)-1))

repeat{
  for(i in 1:nrow(X)) {
    y.hat <- ifelse(X %*% w < 0, -1, 1)
    w <- w + lambda * (y[i] - y.hat[i]) * t(X)[,i]
    W <- rbind.data.frame(W, as.vector(w))
  }
  
  if(all(y == y.hat)) break
}

df <- data.frame(t(rep(NA, 9)))
for(x1 in 0:1)
  for(x2 in 0:1)
    for(x3 in 0:1)
      for(x4 in 0:1)
        for(x5 in 0:1)
          for(x6 in 0:1)
            for(x7 in 0:1)
              for(x8 in 0:1)
                for(x9 in 0:1) {
                  df <- rbind.data.frame(df, c(x1,x2,x3,x4,x5,x6,x7,x8,x9))
                }

df <- df[-1,]
df$Y <- ifelse(rowSums(df) >= 5, 1, -1)

X <- cbind(1, df[,-10]) %>% as.matrix()
y <- df$Y %>% matrix
w <- rep(0, ncol(X)) %>% matrix
lambda <- 0.3

W <- t(w) %>% data.frame
names(W) <- paste0("w", 0:(length(w)-1))

repeat{
  for(i in 1:nrow(X)) {
    y.hat <- ifelse(X %*% w < 0, -1, 1)
    w <- w + lambda * (y[i] - y.hat[i]) * t(X)[,i]
    W <- rbind.data.frame(W, as.vector(w))
  }
  
  if(all(y == y.hat)) break
}
data_index <- sample(1:512, 10)

View(data.frame(df[data_index, ], y.hat[data_index]))
