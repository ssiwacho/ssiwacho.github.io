model in "model.txt"
data in "data.txt"
compile, nchains(1)
parameters in "inits3.txt", chain(1)
initialize
adapt 1000
update 1000
monitor mu, thin(3)
monitor sigma2, thin(3)
update 30000
parameters to "out3.Rdump", chain(1)
coda *, stem(sim.3/CODA)
samplers to sim.3/samplers.csv
update 0
model clear
exit
