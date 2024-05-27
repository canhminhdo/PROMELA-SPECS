#define N   6	/* number of processes */

mtype = {l1, l2, l3, l4, l5, ws, l7, l8, l9, l10, l11, fs, ss, cs};
int nop = N;

int glock = nop;
mtype pc[N] = ss;
int next[N] = nop;
bool lock[N] = false;
int pred[N] = nop;
int cnt = N;

active [N] proctype proc()
{
    do
	:: atomic {
        // want
        pc[_pid] == ss ->
        pc[_pid] = l1;
    }
    :: atomic {
        // stnxt
        pc[_pid] == l1 ->
        pc[_pid] = l2;
        next[_pid] = nop;
    }
    :: atomic {
        // stprd
        pc[_pid] == l2 ->
        pc[_pid] = l3;
        pred[_pid] = glock;
        glock = _pid;
    }
    :: atomic {
        // chprd
        pc[_pid] == l3 ->
        pc[_pid] = (pred[_pid] == nop -> cs : l4);
    }
    :: atomic {
        // stlck
        pc[_pid] == l4 ->
        pc[_pid] = l5;
        lock[_pid] = true;
    }
    :: atomic {
        // stnpr
        pc[_pid] == l5 ->
        pc[_pid] = ws;
        next[pred[_pid]] = _pid;
    }
    :: atomic {
        // chlck
        pc[_pid] == ws && lock[_pid] == false ->
        pc[_pid] = cs;
    }
    :: atomic {
        // exit
        pc[_pid] == cs ->
        pc[_pid] = l7;
    }
    :: atomic {
        // rpnxt
        pc[_pid] == l7 ->
        pc[_pid] = (next[_pid] == nop -> l8 : l11);
    }
    :: atomic {
        // chglk
        pc[_pid] == l8 ->
        pc[_pid] = (glock == _pid -> l9 : l10);
        glock = (glock == _pid -> nop : glock);
    }
    :: atomic {
        // go2rs
        pc[_pid] == l9 ->
        pc[_pid] = fs;
        cnt--;
    }
    :: atomic {
        // rpnxt
        pc[_pid] == l10 && next[_pid] != nop ->
        pc[_pid] = l11;
    }
    :: atomic {
        // stlnx
        pc[_pid] == l11 ->
        pc[_pid] = fs;
        lock[next[_pid]] = false;
        cnt--;
    }
    :: cnt == 0 ->
        break;
    od
    assert(cnt == 0);
}

// ltl mutex { [] !(pc[0] == cs && pc[1] == cs) }
// ltl lofree { [] ((pc[0] == ws) -> (<> (pc[0] == cs))) }
// ltl halt { <> (pc[0] == fs) }

// spins -o3 mcs.pml
// prom2lts-seq --por --proviso=color --strategy=scc --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' mcs.pml.spins
// prom2lts-mc --strategy=cndfs --threads=8 --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' mcs.pml.spins
// prom2lts-mc --strategy=ufscc --threads=8 --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' mcs.pml.spins
