#define N   6	/* number of processes */

mtype = {l1 l2 l3 l4 l5 ws l7 l8 l9 l10 l11 fs ss cs}
int nop = N

int glock = nop
mtype pc[N] = ss
int next[N] = nop
bool lock[N] = false
int pred[N] = nop
int cnt = N;

proctype proc(int i)
{
    do
	:: atomic {
        // want
        pc[i] == ss ->
        pc[i] = l1
    }
    :: atomic {
        // stnxt
        pc[i] == l1 ->
        pc[i] = l2
        next[i] = nop
    }
    :: atomic {
        // stprd
        pc[i] == l2 ->
        pc[i] = l3
        pred[i] = glock
        glock = i
    }
    :: atomic {
        // chprd
        pc[i] == l3 ->
        pc[i] = (pred[i] == nop -> cs : l4)
    }
    :: atomic {
        // stlck
        pc[i] == l4 ->
        pc[i] = l5
        lock[i] = true
    }
    :: atomic {
        // stnpr
        pc[i] == l5 ->
        pc[i] = ws
        next[pred[i]] = i
    }
    :: atomic {
        // chlck
        pc[i] == ws && lock[i] == false ->
        pc[i] = cs
    }
    :: atomic {
        // exit
        pc[i] == cs ->
        pc[i] = l7
    }
    :: atomic {
        // rpnxt
        pc[i] == l7 ->
        pc[i] = (next[i] == nop -> l8 : l11)
    }
    :: atomic {
        // chglk
        pc[i] == l8 ->
        pc[i] = (glock == i -> l9 : l10)
        glock = (glock == i -> nop : glock)
    }
    :: atomic {
        // go2rs
        pc[i] == l9 ->
        pc[i] = fs
        cnt--
    }
    :: atomic {
        // rpnxt
        pc[i] == l10 && next[i] != nop ->
        pc[i] = l11
    }
    :: atomic {
        // stlnx
        pc[i] == l11 ->
        pc[i] = fs
        lock[next[i]] = false
        cnt--
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

init {
    int i = 0
    do
    :: i < N -> run proc(i); i++
    :: else -> break
    od
}

// ltl mutex { [] !(pc[0] == cs && pc[1] == cs) }
ltl lofree { [] ((pc[0] == ws) -> (<> (pc[0] == cs))) }
