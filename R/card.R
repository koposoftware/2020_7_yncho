type1 <- c(260000)
type2 <- c(350400)
type3 <- c(454070)
type4 <- c(70450)
type5 <- c(45000)
type6 <- c(80000)
type7 <- c(80270)
type8 <- c(20700)
type9 <- c(786070)
type10 <- c(378030)
type11 <- c(453070)
type12 <- c(68000)
type13 <- c(78300)
sum <- type1 + type2 + type3 + type4 + type5 + type6 + type7 + type8 + type9 + type10 + type11 + type12 + type13 

type_df = data.frame(type1, type2, type3, type4, type5, 
                     type6, type7, type8, type9, type10, type11, type12, type13 )

type_df[1]


c1 <- c('1', '1Q Daily+', '1Q', '10000', 0,	0.06,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.003,	0.003,	0.003,	
        0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.05,	0,	0,	0,	0,	0,	0,	
        0.05,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)

c2 <- c('2', '1Q Shopping+', '1Q', '10000', 0,	0.06,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.003,	0.003,	0.003,	
        0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.05,	0,	0,	0,	0,	0,	0,	
        0.05,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)

c3 <- c('3', '1Q Special+', '1Q', '10000', 0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.07,	0,	0,	0,	0,	
        0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	
        0.05,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)

c4 <- c('4', '1Q My Cafe', 'CR', '17000', 0,	0, 0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	
        0,	0,	0,	0,	0,	0,	0,	0,	0,	0.07,	0,	0,	0,	0,	0,	0,	0.05,
        0,	0,	0.07,	0,	0.07,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)


hae_df = data.frame(c1, c2, c3, c4)

hae_df2 <- t(hae_df)
typeof(hae_df2)

hae_df2 <- as.data.frame(hae_df2, string.as.factor=false)
colnames(hae_df2) <- c('CARD_PRODUCT_CODE', 'CARD_PRODUCT_NAME','CARD_TYPE', 'ANNUAL_FEE', 'I1DISCOUNT',	
                       'I2DISCOUNT',	'I3DISCOUNT',	'I4DISCOUNT',	'I5DISCOUNT',	'I6DISCOUNT',	'I7DISCOUNT',	
                       'I8DISCOUNT',	'I9DISCOUNT',	'I10DISCOUNT',	'I11DISCOUNT',	'I12DISCOUNT',	
                       'I13DISCOUNT',	'I1UNLIMIT',	'I2UNLIMIT',	'I3UNLIMIT',	'I4UNLIMIT',	'I5UNLIMIT',	
                       'I6UNLIMIT',	'I7UNLIMIT',	'I8UNLIMIT',	'I9UNLIMIT',	'I10UNLIMIT',	'I11UNLIMIT',	
                       'I12UNLIMIT',	'I13UNLIMIT',	'I1LIMIT',	'I2LIMIT',	'I3LIMIT',	'I4LIMIT',	
                       'I5LIMIT',	'I6LIMIT',	'I7LIMIT',	'I8LIMIT',	'I9LIMIT',	'I10LIMIT',	
                       'I11LIMIT',	'I12LIMIT',	'I13LIMIT',	'I1MILE',	'I2MILE',	'I3MILE',	'I4MILE',	
                       'I5MILE',	'I6MILE',	'I7MILE',	'I8MILE',	'I9MILE',	'I10MILE',	'I11MILE',	'I12MILE',	'I13MILE')

hae_df2
#rownames(hae_df2) <- c(1:4)

typeof(hae_df2)
hae_df2
str(hae_df2)

colnames(hae_df2)
hae_df2
hae_df2[, 5:length(hae_df2)] <- sapply(hae_df2[, 5:length(hae_df2)], as.character)
hae_df2[, 5:length(hae_df2)] <- sapply(hae_df2[, 5:length(hae_df2)], as.numeric)


type_df

hae_df2
hae_df3 <- hae_df2[5:length(hae_df2)]

result_df <- data.frame()

# ctrl + shif + c : 전체주석

# for (i in 1:length(type_df)){
#   #print(i)
#   print(type_df[[i]])
#   
#   for(j in 1:nrow(hae_df2)){
#     for(k in 1:length(hae_df2)){
#       print(type_df[[i]] * hae_df2[j, k])
#     }
#   }
# }



# for (i in 1){
#   #print(i)
#   print(type_df[[i]])
#   
#   for(j in 1:nrow(hae_df3)){
#     tmp = 0
#     for(k in 1:length(hae_df3)){
#       #print(type_df[[i]] * hae_df3[j, k])
#       a = type_df[[i]] * hae_df3[j, k]
#       #print(a)
#       tmp = tmp +  a
#       #print(tmp)
#     }
#     print(tmp)
#     print('================')
#   }
# }


# 한도 없이 비율만큼 계산.
for (i in 1){
  #print(i)
  print(type_df[[i]])
  
  maxValue = 0
  maxNum = 0
  for(j in 1:nrow(hae_df3)){
    
    
    
    tmp = 0
    for(k in c(1, 14, 27, 40)){
      #print(type_df[[i]] * hae_df3[j, k])
      a = type_df[[i]] * hae_df3[j, k]
      #print(a)
      tmp = tmp +  a
      #print(tmp)
    }
    print('================')
    print(tmp)
    
    
    
    
  }
}



type_df
hae_df3
result_df
hae_df3[27]




# I1에 대한 할인, 적립, 마일리지 합계가 가장 높은 BEST1 카드 구하기
# 결과 : I1 profit 합계, 카드명


maxValue = 0
maxRowNum = 0

for (i in 1){
  #print(i)
  #print(type_df[[i]])
  
  for(j in 1:nrow(hae_df3)){
    
    
    
    totalProfit = 0
    for(k in c(1, 14, 27, 40)){
      #print(type_df[[i]] * hae_df3[j, k])
      profit = type_df[[i]] * hae_df3[j, k]
      
      totalProfit = totalProfit +  profit
      
    }
    print('================')
    cat('totalProfit : ',  totalProfit, '\n')
    
    if(totalProfit > maxValue){
      maxValue = totalProfit
      maxRowNum = j
      
    }
    
    
  }
}

#rm(list='maxValue')
print(maxValue)
print(maxRowNum)
cardName <- hae_df2[[4, 2]]
print(cardName)





#########################################################

type1 <- c(260000)
type2 <- c(350400)
type3 <- c(454070)
type4 <- c(70450)
type5 <- c(45000)
type6 <- c(80000)
type7 <- c(80270)
type8 <- c(20700)
type9 <- c(786070)
type10 <- c(378030)
type11 <- c(453070)
type12 <- c(68000)
type13 <- c(78300)
sum <- type1 + type2 + type3 + type4 + type5 + type6 + type7 + type8 + type9 + type10 + type11 + type12 + type13 

type_df = data.frame(type1, type2, type3, type4, type5, 
                     type6, type7, type8, type9, type10, type11, type12, type13 )



c1 <- c('1', '1Q Daily+', '1Q', '10000', 0,	0.06,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.003,	0.003,	0.003,	
        0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.05,	0,	0,	0,	0,	0,	0,	
        0.05,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)

c2 <- c('2', '1Q Shopping+', '1Q', '10000', 0,	0.06,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.003,	0.003,	0.003,	
        0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.05,	0,	0,	0,	0,	0,	0,	
        0.05,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)

c3 <- c('3', '1Q Special+', '1Q', '10000', 0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.07,	0,	0,	0,	0,	
        0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	
        0.05,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)

c4 <- c('4', '1Q My Cafe', 'CR', '17000', 0,	0, 0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	
        0,	0,	0,	0,	0,	0,	0,	0,	0,	0.07,	0,	0,	0,	0,	0,	0,	0.05,
        0,	0,	0.07,	0,	0.07,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)


hae_df = data.frame(c1, c2, c3, c4)
hae_df2 <- t(hae_df)
hae_df2 <- as.data.frame(hae_df2, string.as.factor=false)
colnames(hae_df2) <- c('CARD_PRODUCT_CODE', 'CARD_PRODUCT_NAME','CARD_TYPE', 'ANNUAL_FEE', 'I1DISCOUNT',	
                       'I2DISCOUNT',	'I3DISCOUNT',	'I4DISCOUNT',	'I5DISCOUNT',	'I6DISCOUNT',	'I7DISCOUNT',	
                       'I8DISCOUNT',	'I9DISCOUNT',	'I10DISCOUNT',	'I11DISCOUNT',	'I12DISCOUNT',	
                       'I13DISCOUNT',	'I1UNLIMIT',	'I2UNLIMIT',	'I3UNLIMIT',	'I4UNLIMIT',	'I5UNLIMIT',	
                       'I6UNLIMIT',	'I7UNLIMIT',	'I8UNLIMIT',	'I9UNLIMIT',	'I10UNLIMIT',	'I11UNLIMIT',	
                       'I12UNLIMIT',	'I13UNLIMIT',	'I1LIMIT',	'I2LIMIT',	'I3LIMIT',	'I4LIMIT',	
                       'I5LIMIT',	'I6LIMIT',	'I7LIMIT',	'I8LIMIT',	'I9LIMIT',	'I10LIMIT',	
                       'I11LIMIT',	'I12LIMIT',	'I13LIMIT',	'I1MILE',	'I2MILE',	'I3MILE',	'I4MILE',	
                       'I5MILE',	'I6MILE',	'I7MILE',	'I8MILE',	'I9MILE',	'I10MILE',	'I11MILE',	'I12MILE',	'I13MILE')

#rownames(hae_df2) <- c(1:4)
typeof(hae_df2)
hae_df2
str(hae_df2)

colnames(hae_df2)
hae_df2[, 5:length(hae_df2)] <- sapply(hae_df2[, 5:length(hae_df2)], as.character)
hae_df2[, 5:length(hae_df2)] <- sapply(hae_df2[, 5:length(hae_df2)], as.numeric)

hae_df2
hae_df3 <- hae_df2[5:length(hae_df2)]




# hae_df3 : 항상 똑같으니까 인자로 넣지 않는다.
# type_df : 값이 달라지니까 인자로 넣는다.
getBestOneCard <- function(type_df){
  
  maxValue = 0
  maxRowNum = 0
  
  for (i in 1:length(type_df)){
    #print(i)
    #print(type_df[[i]])
    
    for(j in 1:nrow(hae_df3)){
      
      
      
      totalProfit = 0
      for(k in c(i, i+13, i+26, i+40)){
        #print(type_df[[i]] * hae_df3[j, k])
        profit = type_df[[i]] * hae_df3[j, k]
        
        totalProfit = totalProfit +  profit
        
      }
      print('================')
      cat('totalProfit : ',  totalProfit, '\n')
      
      if(totalProfit > maxValue){
        maxValue = totalProfit
        maxRowNum = j
        
      }
      
      
    }
  }
  cardName <- hae_df2[[4, 2]]
  
  result <- list(maxValue = maxValue, maxRowNum = maxRowNum, cardName = cardName)
  
  return (result)
  
}




#rm(list='maxValue')
print(maxValue)
print(maxRowNum)
cardName <- hae_df2[[4, 2]]
print(cardName)


#########################################################
# 함수명  : getBestOneCard()
# 설명    : 전체 업종코드에 대한 할인, 적립, 마일리지 합계가 가장 높은 BEST1 카드 구하기
# input   : type_df
# 결과    : profit 합계, 카드명

rm(list=ls())

type1 <- c(100000)
type2 <- c(100000)
type3 <- c(100000)
type4 <- c(100000)
type5 <- c(80000)
type6 <- c(80000)
type7 <- c(80000)
type8 <- c(80000)
type9 <- c(80000)
type10 <- c(80000)
type11 <- c(60000)
type12 <- c(60000)
type13 <- c(60000)
#sum <- type1 + type2 + type3 + type4 + type5 + type6 + type7 + type8 + type9 + type10 + type11 + type12 + type13 

type_df <- data.frame(type1, type2, type3, type4, type5, 
                     type6, type7, type8, type9, type10, type11, type12, type13 )


c1 <- c('1', '1Q Daily+', '1Q', '10000', 0,	0.06,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.003,	0.003,	0.003,	
        0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.05,	0,	0,	0,	0,	0,	0,	
        0.05,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)

c2 <- c('2', '1Q Shopping+', '1Q', '10000', 0,	0.06,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.003,	0.003,	0.003,	
        0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.003,	0.05,	0,	0,	0,	0,	0,	0,	
        0.05,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)

c3 <- c('3', '1Q Special+', '1Q', '10000', 0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.07,	0,	0,	0,	0,	
        0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	
        0.05,	0,	0,	0,	0,	0.05,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)

c4 <- c('4', '1Q My Cafe', 'CR', '17000', 0,	0, 0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	
        0,	0,	0,	0,	0,	0,	0,	0,	0,	0.07,	0,	0,	0,	0,	0,	0,	0.05,
        0,	0,	0.07,	0,	0.07,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)


hae_df <- data.frame(c1, c2, c3, c4)
hae_df2 <- t(hae_df)
#typeof(hae_df2)

hae_df2 <- as.data.frame(hae_df2, string.as.factor=false)
colnames(hae_df2) <- c('CARD_PRODUCT_CODE', 'CARD_PRODUCT_NAME','CARD_TYPE', 'ANNUAL_FEE', 'I1DISCOUNT',	
                       'I2DISCOUNT',	'I3DISCOUNT',	'I4DISCOUNT',	'I5DISCOUNT',	'I6DISCOUNT',	'I7DISCOUNT',	
                       'I8DISCOUNT',	'I9DISCOUNT',	'I10DISCOUNT',	'I11DISCOUNT',	'I12DISCOUNT',	
                       'I13DISCOUNT',	'I1UNLIMIT',	'I2UNLIMIT',	'I3UNLIMIT',	'I4UNLIMIT',	'I5UNLIMIT',	
                       'I6UNLIMIT',	'I7UNLIMIT',	'I8UNLIMIT',	'I9UNLIMIT',	'I10UNLIMIT',	'I11UNLIMIT',	
                       'I12UNLIMIT',	'I13UNLIMIT',	'I1LIMIT',	'I2LIMIT',	'I3LIMIT',	'I4LIMIT',	
                       'I5LIMIT',	'I6LIMIT',	'I7LIMIT',	'I8LIMIT',	'I9LIMIT',	'I10LIMIT',	
                       'I11LIMIT',	'I12LIMIT',	'I13LIMIT',	'I1MILE',	'I2MILE',	'I3MILE',	'I4MILE',	
                       'I5MILE',	'I6MILE',	'I7MILE',	'I8MILE',	'I9MILE',	'I10MILE',	'I11MILE',	'I12MILE',	'I13MILE')

#hae_df2
#rownames(hae_df2) <- c(1:4)
#typeof(hae_df2)
#str(hae_df2)

#colnames(hae_df2)
#hae_df2
hae_df2[, 5:length(hae_df2)] <- sapply(hae_df2[, 5:length(hae_df2)], as.character)
hae_df2[, 5:length(hae_df2)] <- sapply(hae_df2[, 5:length(hae_df2)], as.numeric)

hae_df3 <- hae_df2[5:length(hae_df2)]
type_df


getBestOneCard <- function(type_df){
  
  maxSumTotal <- 0
  maxRowNum <- 0
  
  for (i in 1:nrow(hae_df3)){
    
    totalDiscount <- 0
    totalUnlimit <- 0
    totalLimit <- 0
    totalMile <- 0
    sumTotal <- 0
    
    cat('================', i, '================', '\n')
    for (j in 1:length(type_df)){
      totalDiscount <- totalDiscount + (type_df[[i]] * hae_df3[i, j])
      totalUnlimit <- totalUnlimit + (type_df[[i]] * hae_df3[i, j+13])
      totalLimit <- totalLimit + (type_df[[i]] * hae_df3[i, j+26])
      totalMile <- totalMile + (type_df[[i]] * hae_df3[i, j+39])

      
      cat('>>>>>', j, '<<<<<', '\n')
      
      cat('totalDiscount', totalDiscount, '\n')
      cat('totalUnlimit', totalUnlimit, '\n')
      cat('totalLimit', totalLimit, '\n')
      cat('totalMile', totalMile, '\n')

    }
    
    sumTotal <- sumTotal + (totalDiscount + totalUnlimit + totalLimit + totalMile)
    cat('sumTotal', sumTotal, '\n')
    
    
    #print('sumTotal')
    #print(sumTotal)
    #cat('i = ' , i , ' j = ', j, '\n', 'sumTotal : ', sumTotal)
    
    if(sumTotal > maxSumTotal){
      maxSumTotal <- sumTotal
      maxRowNum <- i
    }
    
  }
  cardName <- as.character(hae_df2[[maxRowNum, 2]])
  
  result <- list(maxSumTotal = maxSumTotal, cardName = cardName)
  return(result)
}


result <- getBestOneCard(type_df)
result
