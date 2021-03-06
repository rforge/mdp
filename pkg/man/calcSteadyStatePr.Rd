\name{calcSteadyStatePr}
\alias{calcSteadyStatePr}
\title{Calculate the steady state transition probabilities for the founder process (level 0).}
\usage{
  calcSteadyStatePr(mdp)
}
\arguments{
  \item{mdp}{The MDP loaded using \link{loadMDP}.}
}
\value{
  A vector stady state probabilities for all the states.
}
\description{
  Assume that we consider an ergodic/irreducible
  time-homogeneous Markov chain specified using a policy in
  the MDP.
}
\author{
  Lars Relund \email{lars@relund.dk}
}

