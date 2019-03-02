# inverse a matrix
# 1. using solve()
c <- matrix(c(1,0,2,-1,5,0,0,3,-9),3,3)
tc <- t(c)
tc
solve(tc)

# 2.Package matlib, using function inv() or Inverse()
library(matlib)
inv(tc)
Inverse(tc)

solve(tc)==inv(tc)

# matrix multiplication
t1 <- matrix(1:4,2,2, byrow = T)
t1

t2 <- matrix(c(2,0,1,2),2,2,byrow = T)
t2

t1%*%t2


# matrix subset
c <- matrix(1:30,5,6)
c

c[-c(1,2),]