model in "model.txt"
data in "data.txt"
compile, nchains(1)
parameters in "inits1.txt", chain(1)
initialize
adapt 1000
update 1000
monitor mu, thin(3)
monitor sigma2, thin(3)
update 30000
parameters to "out1.Rdump", chain(1)
coda *, stem(sim.1/CODA)
samplers to sim.1/samplers.csv
update 0
model clear
exit
