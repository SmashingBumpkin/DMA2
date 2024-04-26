setwd('C:/Users/Charl/Documents/GitHub/DMA2')
load('disneypixar_posts.RData')

library(tm)

library(SnowballC)
head(posts)
str(posts)
texts = posts$message
head(texts, n=60)#Theres a bunch of unicode in here

texts <- iconv(texts, 'UTF-8', 'ASCII')
corpus <- Corpus(VectorSource(texts))
corpus
head(summary(corpus)) # looking at what kind of data is in the corpus
inspect(corpus[560]) #Looking at a specific entry in the corpus
writeLines(as.character(corpus[560]))
getTransformations()
toSpace <- content_transformer(function(x, pattern) {return (gsub(pattern, " ", x))})
corpus <- tm_map(corpus, toSpace, "-")
corpus <- tm_map(corpus, toSpace, ":")

# Convert the text to lower case
corpus <- tm_map(corpus, content_transformer(tolower))
writeLines(as.character(corpus[[560]]))

corpus <- tm_map(corpus, removeNumbers)
writeLines(as.character(corpus[[560]]))

corpus <- tm_map(corpus, removeWords, stopwords("english"))
writeLines(as.character(corpus[[560]]))

corpus <- tm_map(corpus, removePunctuation)
writeLines(as.character(corpus[[560]]))

# Eliminate extra white spaces
corpus <- tm_map(corpus, stripWhitespace)

dtm = DocumentTermMatrix(corpus)
dtm

freq <- colSums(as.matrix(dtm))
freq[46:49]

ord <- order(freq, decreasing = TRUE)
freq[head(ord)]

findFreqTerms(dtm, lowfreq = 10)

wf = data.frame(word = names(freq), # names() allows to get or set the names of an object
                freq = freq)
head(wf)
plot(density(wf$freq))

library(ggplot2)
ggplot(subset(wf, freq>10), aes(x = reorder(word, -freq), y = freq)) +
  geom_bar(stat = "identity") + 
  labs(x = "", y = "frequency") +
  theme(axis.text.x=element_text(angle=45, hjust=1))
library(wordcloud)
wordcloud(wf$word, wf$freq, 
          min.freq = 10, 
          rot.per = 0.15, 
          colors = brewer.pal(8, "Dark2")
)
wordcloud(wf$word, wf$freq, 
          scale=c(5,0.5), min.freq = 5, 
          random.order = F, 
          rot.per = 0.15, 
          colors = brewer.pal(8, "Spectral")
)
library('syuzhet')
sentiment = get_nrc_sentiment(texts)
td = data.frame(t(sentiment))
td[,1:5]

td = data.frame(rowSums(td[-1]))
names(td)[1] <- "count"
td
tdw <- cbind("sentiment" = rownames(td), td)
rownames(tdw) <- NULL
tdw
td_em  = tdw[1:8, ] # emotions
td_pol = tdw[9:10, ] # polarity
ggplot(td_em, aes(x = sentiment, y = count, fill = sentiment)) +
  geom_bar(stat = "identity") +
  labs(x = "emotion") +
  theme(axis.text.x=element_text(angle=45, hjust=1), legend.title = element_blank())
ggplot(td_pol, aes(x = sentiment, y = count, fill = sentiment)) +
  geom_bar(stat = "identity") +
  labs(x = "polarity") +
  theme(axis.text.x=element_text(angle=45, hjust=1), legend.title = element_blank())


#HW remove "http"
#HW Do sentiment vs time on dataset