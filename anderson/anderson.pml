#define N   9	/* number of processes */

mtype = {rs, ws, cs, fs};
mtype pc[N] = rs;
int place[N] = 0;
bool array[N] = false;
int next = 0;
int cnt = N;

active [N] proctype proc()
{
    atomic {
        if
        :: _pid == 0 ->
            array[_pid] = true;
        :: else ->
            skip;
        fi
    }
    do
	:: atomic {
        pc[_pid] == rs ->
        pc[_pid] = ws;
        place[_pid] = next;
        next = (next + 1) % N;
    }
    :: atomic {
        pc[_pid] == ws && array[place[_pid]] == true ->
        pc[_pid] = cs;
    }
    :: atomic {
        pc[_pid] == cs ->
        pc[_pid] = fs;
        array[place[_pid]] = false;
        array[(place[_pid] + 1) % N] = true;
        cnt--;
    }
    :: cnt == 0 ->
        break;
    od
    assert(cnt == 0);
}

// ltl mutex { [] !(pc[0] == cs && pc[1] == cs) }
// ltl lofree { [] ((pc[0] == ws) -> (<> (pc[0] == cs))) }

// spins -o3 anderson.pml
// prom2lts-seq --por --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' anderson.pml.spins
// prom2lts-seq --por --proviso=color --strategy=dfs --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' anderson.pml.spins
// prom2lts-mc --strategy=cndfs --threads=8 --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' anderson.pml.spins
// prom2lts-mc --strategy=ufscc --threads=8 --ltl='[] ((pc\[0\] == "ws") -> (<> (pc\[0\] == "cs")))' anderson.pml.spins