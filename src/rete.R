news = dataset7$V1
titolo = dataset7$V2
categoria = dataset7$V3
fonte = dataset7$V5

datasetNews = data.frame(news, titolo, categoria, fonte)

datasetNews[,1:4]=lapply(datasetNews[,1:4], as.factor)


wl = matrix(c("fonte", "news", "titolo", "news", "categoria", "news"), ncol = 2, byrow = TRUE, dimnames = list(NULL, c("from", "to")))


dag = hc(datasetNews, whitelist = wl) #Provo algoritmo Hill-Climbing
modelstring(dag)
plot(dag)
dag
graphviz.plot(dag)


obj2 = bn.fit (dag,  data  = datasetNews)
obj2
