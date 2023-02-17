#define N	13	/* number of processes */

mtype = {ss, ws, cs, fs}
mtype pc[N] = ss
bool locked = false;
int cnt = N;

proctype proc(int i)
{
    do
	:: atomic {
        pc[i] == ss ->
        pc[i] = ws
    }
    :: atomic {
        pc[i] == ws && locked == false ->
        pc[i] = cs
        locked = true
    }
    :: atomic {
        pc[i] == cs ->
        pc[i] = fs
        cnt--
        locked = false
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
ltl lofree { [] ((pc[1] == ws) -> (<> (pc[1] == cs))) }
