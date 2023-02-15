#define N   9	/* number of processes */

mtype = {rs, ws, cs, fs}
mtype pc[N] = rs
int place[N] = 0
bool array[N] = false
int next = 0
int cnt = N;

proctype proc(int i)
{
    do
	:: atomic {
        pc[i] == rs ->
        pc[i] = ws
        place[i] = next
        next = (next + 1) % N
    }
    :: atomic {
        pc[i] == ws && array[place[i]] == true ->
        pc[i] = cs
    }
    :: atomic {
        pc[i] == cs ->
        pc[i] = fs
        array[place[i]] = false
        array[(place[i] + 1) % N] = true
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

init {
    array[0] = true
    run proc(0)
    run proc(1)
    run proc(2)
    run proc(3)
    run proc(4)
    run proc(5)
    run proc(6)
    run proc(7)
    run proc(8)
}

// ltl mutex { [] !(pc[0] == cs && pc[1] == cs) }
ltl lofree { [] ((pc[0] == ws) -> (<> (pc[0] == cs))) }
