model in "model.txt"
data in "data.txt"
compile, nchains(1)
parameters in "inits2.txt", chain(1)
initialize
adapt 1000
update 1000
monitor mu, thin(3)
monitor sigma2, thin(3)
update 30000
parameters to "out2.Rdump", chain(1)
coda *, stem(sim.2/CODA)
samplers to sim.2/samplers.csv
update 0
model clear
exit
