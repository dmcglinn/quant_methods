panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor=3, ...)
{
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r <- abs(cor(x, y))
    txt <- format(c(r, 0.123456789), digits = digits)[1]
    txt <- paste0(prefix, txt)
    if(missing(cex.cor)) 
        cex.cor <- 0.8/strwidth(txt)
    text(0.5, 0.5, txt, cex = cex.cor)
}

"cleanplot.pca" <- function(res.pca, ax1=1, ax2=2, point=FALSE, 
                            ahead=0.07, cex=0.7) 
{
                                # A function to draw two biplots (scaling 1 and scaling 2) from an object 
                                # of class "rda" (PCA or RDA result from vegan's rda() function)
                                #
                                # License: GPL-2 
                                # Authors: Francois Gillet & Daniel Borcard, 24 August 2012
                                
                                require("vegan")
                                
                                par(mfrow=c(1,2))
                                p <- length(res.pca$CA$eig)
                                
                                # Scaling 1: "species" scores scaled to relative eigenvalues
                                sit.sc1 <- scores(res.pca, display="wa", scaling=1, choices=c(1:p))
                                spe.sc1 <- scores(res.pca, display="sp", scaling=1, choices=c(1:p))
                                plot(res.pca, choices=c(ax1, ax2), display=c("wa", "sp"), type="n", 
                                     main="PCA - scaling 1", scaling=1)
                                if (point)
                                {
                                    points(sit.sc1[,ax1], sit.sc1[,ax2], pch=20)
                                    text(res.pca, display="wa", choices=c(ax1, ax2), cex=cex, pos=3, scaling=1)
                                }
                                else
                                {
                                    text(res.pca, display="wa", choices=c(ax1, ax2), cex=cex, scaling=1)
                                }
                                text(res.pca, display="sp", choices=c(ax1, ax2), cex=cex, pos=4, 
                                     col="red", scaling=1)
                                arrows(0, 0, spe.sc1[,ax1], spe.sc1[,ax2], length=ahead, angle=20, col="red")
                                pcacircle(res.pca)
                                
                                # Scaling 2: site scores scaled to relative eigenvalues
                                sit.sc2 <- scores(res.pca, display="wa", choices=c(1:p))
                                spe.sc2 <- scores(res.pca, display="sp", choices=c(1:p))
                                plot(res.pca, choices=c(ax1,ax2), display=c("wa","sp"), type="n", 
                                     main="PCA - scaling 2")
                                if (point) {
                                    points(sit.sc2[,ax1], sit.sc2[,ax2], pch=20)
                                    text(res.pca, display="wa", choices=c(ax1 ,ax2), cex=cex, pos=3)
                                }
                                else
                                {
                                    text(res.pca, display="wa", choices=c(ax1, ax2), cex=cex)
                                }
                                text(res.pca, display="sp", choices=c(ax1, ax2), cex=cex, pos=4, col="red")
                                arrows(0, 0, spe.sc2[,ax1], spe.sc2[,ax2], length=ahead, angle=20, col="red")
                                par(mfrow=c(1,1))
                            }



"pcacircle" <- function (pca) 
{
    # Draws a circle of equilibrium contribution on a PCA plot 
    # generated from a vegan analysis.
    # vegan uses special constants for its outputs, hence 
    # the 'const' value below.
    
    eigenv <- pca$CA$eig
    p <- length(eigenv)
    n <- nrow(pca$CA$u)
    tot <- sum(eigenv)
    const <- ((n - 1) * tot)^0.25
    radius <- (2/p)^0.5
    radius <- radius * const
    symbols(0, 0, circles=radius, inches=FALSE, add=TRUE, fg=2)
}

pseudo_r2 = function(glm_mod) {
    1 -  glm_mod$deviance / glm_mod$null.deviance
}

r2_adj = function(Y, X, Z, method, nperm, dummy=0) {
  ## Returns
  ## a vector of R2, R2adj, and all R2adj replicates that result from permuations
  ## Arguments
  ## Y, X, Z: are species matrix, expl matrix, covar matrix
  ## nperm: the number of permutations to perform, 
  ##  if nperm not specified the analytical r2 and/or r2adj is returned 
  ##  Note: for CCA only the permutation based r2 adj is unbiased 
  ## method: specifies "cca" or "rda"
  ## dummy: a number 0, 1 or 2 depending on how many collinear variables are in the
  ##  explanatory matrix
  ##  dummy is only necessary for the analytical R2adj calculation
  Y = as.matrix(Y)
  X = as.matrix(X)
  if (missing(Z)) {
    cca.emp = eval(parse(text= paste(method, '(Y, X)')))
    r2 = cca.emp$CCA$tot.chi / cca.emp$tot.chi 
    if (missing(nperm)) {
      n = nrow(Y)
      p = ncol(X) - dummy
      out = c(r2, 1 - (((n - 1) / (n - p - 1)) * (1 - r2)))
    }
    else {
      if (nperm <= 0)
        stop('nperm argument must either be a positive integer or not specified')
      rand.r2 = rep(NA, nperm)
      i = 1
      while (i <= nperm) {
        Xrand = X[sample(nrow(X)), ]
        cca.rand = try(eval(parse(text=paste(method, '(Y, Xrand)'))), TRUE)
        if (class(cca.rand) == 'cca') {
          rand.r2[i] = cca.rand$CCA$tot.chi
          if (i %% 100 == 0)
            print(i)
          i = i + 1
        }
      }
      out = c(r2, 
              1 - (1 / (1 - mean(rand.r2 / cca.emp$tot.chi))) * (1 - r2),
              1 - (1 / (1 - rand.r2 / cca.emp$tot.chi)) * (1 - r2))
    }
  }  
  else{
    Z = as.matrix(Z)
    cca.emp = eval(parse(text=paste(method, '(Y, X, Z)')))
    r2 = cca.emp$CCA$tot.chi / cca.emp$tot.chi
    if (missing(nperm)) {
      n = nrow(Y)
      p = ncol(X) - dummy
      out = c(r2, 1 - (((n - 1)/(n - p - 1)) * (1 - r2)))
    }
    else{
      if (nperm <= 0)
        stop('nperm argument must either be a positive integer or not specified')
      rand.r2 = rep(NA, nperm)
      i = 1
      while (i <= nperm) {
        rhold = sample(nrow(X))
        Xrand = X[rhold, ]
        Zrand = Z[rhold, ]
        cca.rand = try(eval(parse(text=paste(method, '(Y, Xrand, Zrand)'))), TRUE)
        if (class(cca.rand) == 'cca') {
          rand.r2[i] = cca.rand$CCA$tot.chi
          if (i %% 100 == 0)
            print(i)
          i = i + 1
        }
      }
      out = c(r2,
              1 - (1 / (1 - mean(rand.r2 / cca.emp$tot.chi))) * (1 - r2),
              1 - (1 / (1 - rand.r2 / cca.emp$tot.chi)) * (1 - r2))
    }  
  }
  return(out)
}