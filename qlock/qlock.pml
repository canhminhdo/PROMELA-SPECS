#define N   10	/* number of processes */

mtype = {ss, ws, cs, fs};
mtype pc[N] = ss;
int cnt = N;
chan queue = [N] of { int };

active [N] proctype proc()
{
    do
	:: atomic {
        pc[_pid] == ss ->
        pc[_pid] = ws;
        queue!_pid;
    }
    :: atomic {
        pc[_pid] == ws; queue?<eval(_pid)>; ->
        pc[_pid] = cs;
    }
    :: atomic {
        pc[_pid] == cs ->
        queue?_;
        pc[_pid] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break;
    od
    assert(cnt == 0);
}

// ltl mutex { [] !(pc[0] == cs && pc[1] == cs) }
// ltl lofree { [] ((pc[0] == ws) -> (<> (pc[0] == cs))) }

// spins -o3 qlock.pml
// prom2lts-seq --por --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' qlock.pml.spins
// prom2lts-mc --strategy=cndfs --threads=2 --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' qlock.pml.spins
