library(PivotalR)
library(caret)
library(e1071)

cid <- db.connect(host = "127.0.0.1", user = "discodb", dbname = "discodb", password =
                    "abc123", port = 5432, madlib = "madlib")


trx<-db.q("select * from dis_tran limit 200",nrows=200,conn.id=cid)


#hist(trx$tran_amt)


#mean(trx$tran_amt)


#median(trx$tran_amt)


arimaModel<-arima(trx$tran_amt[1:100],order = c(2,0,1))


res<-predict(arimaModel, type="response",n.ahead = 10)




#Error


abs(res$pred[1:10]-trx$tran_amt[101:110])/trx$tran_amt[101:110]




max1 <- max(res$pred[1:10])


min1 <- min(res$pred[1:10])


max2 <-max(trx$tran_amt[101:110])


min2 <- min(trx$tran_amt[101:110])


plot(res$pred[1:10],col='red',ylim=c(min(min1,min2),max(max1,max2)))


par(new=T)


plot(trx$tran_amt[101:110],col='blue',ylim=c(min(min1,min2),max(max1,max2)))
