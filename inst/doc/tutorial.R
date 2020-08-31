## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo = TRUE, results = 'hide'--------------------------------------------
suppressMessages(library(pcSteiner))

g <- graph('Bull')

# Prize for 1-st node is 10
E(g)$costs  <- c(3, 3, 3, 3, 3)
V(g)$prizes <- c(10, 2, 2, 2, 2)

terminals <- c(4, 5)

## -----------------------------------------------------------------------------
treeData <- pcs.tree(
        graph=g,
        terminals=c(4,5),
        lambda=1,
        root=3,
        depth=5,
        eps=-1,
        max_iter=10
)

## -----------------------------------------------------------------------------
V(g)$color            <- "gray"
V(g)$color[terminals] <- "red"

E(g)$color                 <- "gray"
E(g)$color[treeData$edges] <- "red"
plot(g)

