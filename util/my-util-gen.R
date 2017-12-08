#
mySummary <- function(mcmcVect, cred=0.95){
  ret = list()
  
  ret$cred <- cred
  ret$mean <- mean(mcmcVect)
  ret$median <- median(mcmcVect)
  
  dns <- density(mcmcVect)
  md <- dns$x[which.max(dns$y)]
  ret$mode <- md
  qt <- quantile(mcmcVect, c(1-cred, cred))
  ret$quantile <- qt
  
  hdi <- HDIofMCMC(mcmcVect, cred)
  
  ret$HDI <- hdi
  
  ret
}

round2 <- function(x, digits = 3){
  round(x*2, (digits-1))/2
}
