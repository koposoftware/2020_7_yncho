maxValue = 0
maxRowNum = 0

for (i in 1:length(type_df)){
  #print(i)
  #print(type_df[[i]])
  
  for(j in 1:nrow(hae_df3)){
   
    totalProfit = 0
    if(i == 1){

      for(k in c(i, i+13, i+26, i+40)){
        #print(type_df[[i]] * hae_df3[j, k])
        profit = type_df[[i]] * hae_df3[j, k]
        
        totalProfit = totalProfit +  profit
        
      }
    }
    
    
    
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




maxSumTotal = 0
maxRowNum = 0

for (i in nrow(hae_df3)){
  
  totalDiscount = 0
  totalUnlimit = 0
  totalLimit = 0
  totalMile = 0
  sumTotal = 0
  
  for (j in length(type_df)){
    
    
    totalDiscount = totalDiscount + (type_df[[i]] * hae_df3[i, j])
    totalUnlimit = totalUnlimit + (type_df[[i]] * hae_df3[i, j+13])
    totalLimit = totalLimit + (type_df[[i]] * hae_df3[i, j+26])
    totalMile = totalMile + (type_df[[i]] * hae_df3[i, j+39])
    
    sumTotal = sumTotal + (totalDiscount + totalUnlimit + totalLimit + totalMile)

  
    # for (k in c(1, 14, 27, 40)){
    #   if(k == 1){
    #     totalDiscount = totalDiscount + (type_df[[i]] * hae_df3[i, k])
    #     
    #   }
    #   if(k == 2){
    #     totalUnlimit = totalUnlimit + (type_df[[i]] * hae_df3[i, k])
    #   }
    #   
    #   if(k == 3){
    #     totalLimit = totalLimit + (type_df[[i]] * hae_df3[i, k])
    #   }
    #   
    #   if(k == 4){
    #     totalMile = totalMile + (type_df[[i]] * hae_df3[i, k])
    #   }
    #   
    # }
    
    #profit = type_df[[i]] * hae_df3[j, k]
    
    
    
  }
  
  
  if(sumTotal > maxSumTotal){
    maxSumTotal = sumTotal
    maxRowNum = i
  }
  
  
  
}

print(maxValue)
print(maxRowNum)
cardName <- hae_df2[[maxRowNum, 2]]
print(cardName)

