library(dplyr)
# Forward propagation computation
x <- matrix(c(7,8))
y <- 1


# Sigmoid (Default)
f <- function(z) 1/(1+exp(-z)) 

a.0 <- x
b.1 <- matrix(c(0.1, 0.5))
b.2 <- matrix(c(3.9))
W.1 <- matrix(c(0.3, 0.7, 0.5, 0.4), byrow = T, ncol=2)
W.2 <- matrix(c(1.2, 2.6), byrow = T, ncol=2)

(b.1 + W.1 %*% a.0) %>% f

f.1 <- function(z) {
  1 / (1 + exp(-z))
}
f.2 <- function(z) {
  tanh(z)
}
f.3 <- function(z)
{
  pmax(0.1 * z, z)
}

a.0 <- c(1.2, 5.9, 2.3, 0.2) %>% matrix
b.1 <- c(rep(1.2, 4)) %>% matrix
w.1 <- c(rep(0.6, 16)) %>% matrix(., ncol = 4)

a.1 <- f.1(b.1 + w.1 %*% a.0)

b.2 <- b.1
w.2 <- w.1
a.2 <- f.2(b.2 + w.2 %*% a.1)

b.3 <- c(1.2) %>% matrix
w.3 <- c(rep(2.7, 4)) %>% t

w.3 %>% t

a.3 <- f.3(b.3 + w.3 %*% a.2)

a.3 %>% str


for(i in 1:100) {
  a.1 <- f(b.1 + W.1 %*% a.0)
  a.2 <- f(b.2 + W.2 %*% a.1) %>% as.vector
  y.hat <- a.2
  
  # Back propagation computation
  alpha <- 0.3
  delta.2 <- a.2 - y
  
  gr.2 <- delta.2*a.2*(1-a.2) * rbind(1,a.1)
  
  b.2 <- b.2 - alpha*gr.2[1]      # b.2 update
  W.2 <- W.2 - alpha*gr.2[-1]     # W.2 update
  
  delta.1 <- delta.2 * a.2 * (1-a.2) * W.2 
  
  gr.1 <- (t(delta.1)*a.1*(1-a.1)) %*% cbind(1,t(a.0))
  
  b.1 <- b.1 - alpha*gr.1[,1]      # b.1 update
  W.1 <- W.1 - alpha*gr.1[,-1]     # W.1 update
}
a.1 <- f(b.1 + W.1 %*% a.0)
a.2 <- f(b.2 + W.2 %*% a.1) %>% as.vector
y.hat <- a.2
y.hat %>% View()

