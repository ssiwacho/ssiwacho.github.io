library(rmarkdown)
render("/Users/siwachoat/Library/Mobile Documents/com~apple~CloudDocs/github/ssiwacho/2758501/ssiwacho.github.io/deep learning/DL2.rmd")

render("/Users/siwachoat/Library/Mobile Documents/com~apple~CloudDocs/github/ssiwacho/2758501/ssiwacho.github.io/network/network.rmd")

install.packages("igraph")
library(igraph)


friend<-read.csv("/Users/siwachoat/Library/Mobile Documents/com~apple~CloudDocs/github/ssiwacho/2758501/ssiwacho.github.io/network/personallity_know_edgelist.csv")
interaction<-read.csv("/Users/siwachoat/Library/Mobile Documents/com~apple~CloudDocs/github/ssiwacho/2758501/ssiwacho.github.io/network/interaction_edgelist.csv")


friend_graph <- graph.data.frame(friend, directed = F)
friend_graph2 <- graph.data.frame(friend, directed = T)
plot(friend_graph)




add<-function(a,b)
{
a+b->output
return(output)
}

for (i in 1:N)
{
x <- 0 + i
return(x)
}

