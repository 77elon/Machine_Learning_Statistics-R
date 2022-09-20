
forward <- function(x)
{
  f.1 <- function(z)
  {
    1 / (1 + exp(-z))
  }
  
  f.2 <- function(z)
  {
    max(0, z)
  }
  w.1 <- 0.3
  w.2 <- 7.5
  
  b.1 <- 0.9
  b.2 <- 6.8
  f.1(b.1 + x %*% w.1) %>% print
  f.2(b.2 + f.1((b.1 + x %*% w.1)) %*% w.2)
}


7 %>% forward


forward_exer1 <- function(x)
{
 f.1 <- function(z)
 {
   1 / (1 + exp(-z))
 }
 f.2 <- function(z)
 {
   tanh(z)
 }
 f.3 <- function(z)
 {
   pmax(0.1 * z, z)
 }
 
 a.0 <- x
 
 b.1 <- c(rep(1.2, 4)) %>% matrix(., nrow = 4)
 b.2 <- b.1
 b.3 <- 1.2
 
 w.1 <- c(rep(0.6, 16)) %>% matrix(., ncol = 4)
 w.2 <- w.1
 w.3 <- c(rep(2.7, 4)) %>% matrix(., ncol = 4)
 
 a.1 <- (b.1 + w.1 %*% a.0) %>% f.1 %>% `colnames<-`("a.1") %>% print(.)
 a.2 <- (b.2 + w.2 %*% a.1) %>% f.2 %>% `colnames<-`("a.2") %>% print(.)
 a.3 <- (b.3 + w.3 %*% a.2) %>% f.3 %>% `colnames<-`("a.3") %>% print(.)

 ((13 - a.3) / 1) %>% `colnames<-`("Loss") %>% print(.)
 
}

c(1.2, 5.9, 2.3, 0.2) %>% matrix(., nrow = 4) %>% forward_exer1


