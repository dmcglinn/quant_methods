
sum2c <- function(x) {
    return(c(x, x[length(x)] + x[length(x)-1]))
}

get_fib <- function(x, depth) {
    output <- x
    for(i in 1:depth) 
       output <- sum2c(output)
    return(output)
}

get_ratios <- function(x) {
  return(x[-1] / x[-length(x)])
}

plot_fib <- function(x) {
    x <- rev(x)
    xlims <- c(0, x[1] + x[2])
    ylims <- c(0, x[1])
    plot(1, 1, type ='n', xlim = xlims, ylim = ylims)
    for (i in seq_along(x)) 
        polygon(c(0, x[i], x[i], 0), 
                c(x[i], x[i], 0, 0), col=i)
}

plot_fib2 <- function(x) {
  x <- rev(x)
  xlims <- c(0, x[1] + x[2])
  ylims <- c(0, x[1])
  plot(1, 1, type ='n', xlim = xlims, ylim = ylims)
  for (i in seq_along(x)) {
    if (i == 1) {
       x_start <- 0            ; y_start <- 0
       x_end <- x[i]           ; y_end <- x[i]
       polygon(c(x_end  , x_start, x_start, x_end), 
               c(y_start, y_start, y_end  , y_end),
               col=i)
    } else {
      
       if (i %% 2 == 0) { # even
       x_start <- x_end        ; y_start <- y_end 
       x_end <- x_start + x[i] ; y_end <- y_start - x[i]
       polygon(c(x_start, x_end  , x_end, x_start), 
               c(y_start, y_start, y_end  , y_end),
               col=i)
       } else {
       x_start <- x_end      ; y_start <- y_end 
       x_end <- x_end - x[i] ; y_end <- y_start - x[i]  
       polygon(c(x_start, x_end, x_end, x_start), c(y_end, y_end, y_start, y_start),
               col=i)
       }
    }
  }
}


sum2c(0:1)
sum2c(3:4)

sum2c(c(0, 1, 1, 2, 3, 5))

sum2c(sum2c(sum2c(sum2c(0:1))))

fs <- get_fib(0:1, 20)

get_ratios(fs)

plot(fs, type = 'o', log='y')
plot(get_ratios(fs), type ='o')
abline(h = (1 + sqrt(5)) / 2, lty=2) # golden ratio


