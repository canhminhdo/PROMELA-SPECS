# PROMELA Specifications for TAS, Qlock, Anderson, and MCS case studies

This repo contains the PROMELA specifications for TAS, QLOCK, Anderson, and MCS case studies and the output logs for the comparison of $L+1$-DCA2L2MC with Maude LTL model checker, SPIN, and LTSmin.

## How to run experiments with SPIN
For example, we want to conduct experiments with SPIN for TAS protocol.

- Step 1: Uncomment one of properties specified in tas/tas.pml

```
// ltl mutex { [] !(pc[0] == cs && pc[1] == cs) }
ltl lofree { [] ((pc[1] == ws) -> (<> (pc[1] == cs))) }
```

- Step 2: Run experiments with the following command.

```
spin -run tas.pml
```

## How to run experiments with LTSmin
For example, we want to conduct experiments with LTSmin for TAS protocol.

- Step 1: Comment all properties specified in tas/tas.pml

```
// ltl mutex { [] !(pc[0] == cs && pc[1] == cs) }
// ltl lofree { [] ((pc[1] == ws) -> (<> (pc[1] == cs))) }
```
- Step 2: Execute the following commands in order.

```
spins -o3 qlock.pml
prom2lts-seq --por --proviso=color --strategy=scc --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' qlock.pml.spins
prom2lts-mc --strategy=cndfs --threads=8 --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' qlock.pml.spins
prom2lts-mc --strategy=ufscc --threads=8 --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' qlock.pml.spins
```