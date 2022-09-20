state <- as.data.frame(state.x77)
model1 <- lm(state$Murder ~ state$Population + state$Income + state$Illiteracy + state$`Life Exp` + state$Frost)

model1 %>% summary
model1$coefficients

y.hat <- model1$fitted.values
y.hat
y.bar <- mean(state$Murder)
SSE <- ((state$Murder - y.hat)^ 2) %>% sum #deviance(model1)
SSR <- ((y.hat - y.bar)^ 2) %>% sum


deviance(model1) #SSE

anova(model1)

str(model1, max = 1)
Model_df <- nrow(state) - err_df - 1
Err_df <- model1$df.residual

MSR <- (SSR / Model_df)
MSE <- (SSE / Err_df)

F_stat <- MSR / MSE
p_val <- pf(MSR/MSE, Model_df, Err_df, lower.tail = FALSE)

anova_table <- data.frame(
  "Source" = c("Model", "Error", "Total"), 
  "DF" = c(Model_df, Err_df, (Model_df + Err_df)), 
  "SS" = c(SSR, SSE, (SSE + SSR)), 
  "MS" = c(MSR, MSE, NA), 
  "F"= c(F_stat, NA, NA), 
  "P-Value" = c(p_val, NA, NA))

View(anova_table)

summary(model1)



anova_alt = function (object, reg_collapse=TRUE,...) 
{
  if (length(list(object, ...)) > 1L) 
    return(anova.lmlist(object, ...))
  if (!inherits(object, "lm")) 
    warning("calling anova.lm(<fake-lm-object>) ...")
  w <- object$weights
  ssr <- sum(if (is.null(w)) object$residuals^2 else w * object$residuals^2)
  mss <- sum(if (is.null(w)) object$fitted.values^2 else w * 
               object$fitted.values^2)
  if (ssr < 1e-10 * mss) 
    warning("ANOVA F-tests on an essentially perfect fit are unreliable")
  dfr <- df.residual(object)
  p <- object$rank
  if (p > 0L) {
    p1 <- 1L:p
    comp <- object$effects[p1]
    asgn <- object$assign[stats:::qr.lm(object)$pivot][p1]
    nmeffects <- c("(Intercept)", attr(object$terms, "term.labels"))
    tlabels <- nmeffects[1 + unique(asgn)]
    ss <- c(vapply(split(comp^2, asgn), sum, 1), ssr)
    df <- c(lengths(split(asgn, asgn)), dfr)
    if(reg_collapse){
      if(attr(object$terms, "intercept")){
        collapse_p<-2:(length(ss)-1)
        ss<-c(ss[1],sum(ss[collapse_p]),ss[length(ss)])
        df<-c(df[1],sum(df[collapse_p]),df[length(df)])
        tlabels<-c(tlabels[1],"Source")
      } else{
        collapse_p<-1:(length(ss)-1)
        ss<-c(sum(ss[collapse_p]),ss[length(ss)])
        df<-c(df[1],sum(df[collapse_p]),df[length(df)])
        tlabels<-c("Regression")
      }
    }
  }else {
    ss <- ssr
    df <- dfr
    tlabels <- character()
    if(reg_collapse){
      collapse_p<-1:(length(ss)-1)
      ss<-c(sum(ss[collapse_p]),ss[length(ss)])
      df<-c(df[1],sum(df[collapse_p]),df[length(df)])
    }
  }
  
  ms <- ss/df
  f <- ms/(ssr/dfr)
  P <- pf(f, df, dfr, lower.tail = FALSE)
  table <- data.frame(df, ss, ms, f, P)
  table <- rbind(table, 
                 colSums(table))
  table$ms[nrow(table)]<-table$ss[nrow(table)]/table$df[nrow(table)]
  table[length(P):(length(P)+1), 4:5] <- NA
  dimnames(table) <- list(c(tlabels, "Error","Total"), 
                          c("Df","SS", "MS", "F", 
                            "P"))
  if (attr(object$terms, "intercept")){
    table <- table[-1, ]
    table$MS[nrow(table)]<-table$MS[nrow(table)]*(table$Df[nrow(table)])/(table$Df[nrow(table)]-1)
    table$Df[nrow(table)]<-table$Df[nrow(table)]-1
  }
  structure(table, heading = c("Analysis of Variance Table\n"), 
            class = c("anova", "data.frame"))
}

## Warpbreaks example
fm1 <- lm(breaks ~ wool*tension, data = warpbreaks)
anova_alt(fm1)



#(x1 − 4)^2 + x3^2 x1 + (x2 + 1)^2 + 6

f <- function(x1, x2, x3)
{
  (x1 - 4)^2 + x3^2 * x1 + (x2 + 1)^2 + 6
}

x1.prime <- function(x1, x2, x3)
{
  2 * x1 + x3 ^ 2 - 8
}
x1.prime(5,5,5)
x2.prime(5,5,5)
x3.prime(5,5,5)

x2.prime <- function(x1, x2, x3)
{
  2 * x2 + 2
}

x3.prime <- function(x1, x2, x3)
{
  2 * x1 * x3
}
alpha <- 0.1
x <- c(5, 5, 5)

for(i in 1: 90)
{
  gradient <- c(x1.prime(x[1], x[2], x[3]), x2.prime(x[1], x[2], x[3]), x3.prime(x[1], x[2], x[3]))
  x <- x - alpha * gradient
  x %>% print
  f(x[1], x[2], x[3]) %>% print
}

install.packages("Deriv")
library(Deriv)

# (x1 - 4)^2 + x3^2 * x1 + (x2 + 1)^2 + 6

f.1 <- eval(deriv(~(x - 4)^2 + z^2 * x + (y + 1)^2 + 6, c("x","y","z"), func=TRUE))

str(f.1)
grad %>% f.1

f.1(4, -1, 0) # 9.75

a <- f.1(4,-1,0)
a
str(a)
a+1
gradient.1 <-  attributes(f.1(x[1], x[2], x[3]))$gradient
gradient.1[1]

x.1 <- c(5, 5, 5)
alpha <- 0.1

for (i in 1: 1000)
{ 
  
  x.1 <- x.1 - alpha * attributes(f.1(x.1[1], x.1[2], x.1[3]))$gradient
  x.1 %>% print
  
}