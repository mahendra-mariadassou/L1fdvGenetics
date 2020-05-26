## Internal to compute log-likelihood of continuous character under H_0
logh0 <- function(x) {
  mu <- mean(x); sigma <- sd(x)
  sum(dnorm(x, mean = mu, sd = sigma, log = TRUE))
}

## Internal to compute log-likelihood of continuous character under H_1
logh1 <- function(x, y) {
  mu0 <- mean(x); mu1 <- mean(y)
  sigma <- sqrt(((length(x) - 1)*var(x) + (length(y) - 1)*var(y)) / (length(x) + length(y) - 2))
  sum(dnorm(x, mean = mu0, sd = sigma, log = TRUE)) + sum(dnorm(y, mean = mu1, sd = sigma, log = TRUE))
}

## Internal to compute log-likelihood of continuous character under H_1 when marker is not observed
logh1_position <- function(pheno, proba) {
  objective <- function(x) {
    mu0 <- x[1]; mu1 <- x[2]; sigma <- x[3]
    liks <- proba * dnorm(pheno, mean = mu0, sd = sigma) + (1 - proba) * dnorm(pheno, mean = mu1, sd = sigma)
    -sum(log(liks))
  }
  -optim(par = c(10, 10.5, 1), fn = objective,
         lower = c(-Inf, -Inf, 1e-4), method = "L-BFGS-B")$value
}

## Internal function to simulate F1 mice
simulate_F1 <- function(n = 10, map) {
  start <- sample(c(0, 1), size = n, replace = TRUE)
  n_co <- rpois(n = n, lambda = 1)
  co_pos <- Vectorize(runif, vectorize.args = "n")(n = n_co)
  location <- map$Location
  co <- sapply(co_pos, function(x) {
    tabulate(findInterval(100 * x, vec = location), nbins = length(location)-1)
  })
  res <- apply(cbind(start, t(co)), 1, function(x) { cumsum(x) %% 2})
  rownames(res) <- map$Marker
  t(res)
}

#' Compute the LOD score of a marker given a data set
#'
#' @param marker Marker name (e.g. "Marker_1", "Marker_2", should be a column of \code{data}).
#' @param data   Data frame with genotypes and phenotype. Genotypes should be coded 0/1
#' @param phenotype Phenotype name (defaults to "IgG1"), should be a column of \code{data}).
#'
#' @return The LOD score (numeric value)
#' @export
#'
#' @examples
#' data(hw_data)
#' LOD('Marker_1', data = hw_data)
LOD <- function(marker, data, phenotype = "IgG1") {
  geno <- data[ , marker]
  pheno0 <- data[geno == 0, phenotype]
  pheno1 <- data[geno == 1, phenotype]
  pheno01 <- c(pheno0, pheno1)
  lod <- (logh1(pheno0, pheno1) - logh0(pheno01)) * log10(exp(1))
  cat(paste0("LOD score for ", marker, ": ", lod))
  invisible(lod)
}


#' Reconstruct allele based on flanking markers
#'
#' @param la Allele (0/1) at left flanking marker
#' @param ra Allele (0/1) at right flanking marker
#' @param ld Distance (in Morgans) to left flanking marker
#' @param rd Distance (in Morgans) to right flanking marker
#'
#' @return Probability of allele 0 at given position
#' @export
#'
#' @examples
#' ## close to marker with allele 0, likely to be 0
#' reconstruction(la = 0, ra = 1, ld = 0.02, rd = 0.18)
#' ## close to marker with allele 1, unlikely to be 0
#' reconstruction(la = 0, ra = 1, ld = 0.18, rd = 0.02)
reconstruction <- function(la, ra, ld, rd) {
  ## probability p0 when left marker has allele la and is ld cM away
  p <- .5*(1 + exp(-2 * ld/100))
  q <- .5*(1 + exp(-2 * rd/100))
  pl <- ifelse(la == 0, p, 1 - p)
  pr <- ifelse(ra == 0, q, 1 - q)
  pl*pr / (pl*pr + (1-pl)*(1-pr))
}


#' Compute the LOD score at a given position (unobserved) given a data set and a genetic map
#'
#' @inheritParams LOD
#' @param position Position (in cM) of the marker along the chromosome
#' @param genetic_map Genetic map of the chromosome
#'
#' @return LOD score (numeric value)
#' @export
#'
#' @examples
#' data(hw_data)
#' data(genetic_map)
#' LOD_position(position = 48, data = hw_data, map = genetic_map)
LOD_position <- function(position, data, map, phenotype = "IgG1") {
  position <- position
  interval <- findInterval(position, map$Location)
  left  <- data[, interval+1]
  right <- data[, interval+2]
  ld <- position - map$Location[interval]
  rd <- map$Location[interval+1] - position
  pheno <- data[ , phenotype]
  marker <- reconstruction(left, right, ld, rd)
  .logh0 <- logh0(pheno)
  .logh1 <- logh1_position(pheno, marker)
  lod <- (.logh1 - .logh0) * log10(exp(1))
  cat(paste0("LOD score for position ", position, " cM : ", lod))
  invisible(lod)
}
