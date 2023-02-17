#define N   9	/* number of processes */

mtype = {rs, ws, cs, fs};
mtype pc[N] = rs;
int place[N] = 0;
bool array[N] = false;
int next = 0;
int cnt = N;

proctype proc(int i)
{
    do
	:: atomic {
        pc[i] == rs ->
        pc[i] = ws;
        place[i] = next;
        next = (next + 1) % N;
    }
    :: atomic {
        pc[i] == ws && array[place[i]] == true ->
        pc[i] = cs;
    }
    :: atomic {
        pc[i] == cs ->
        pc[i] = fs;
        array[place[i]] = false;
        array[(place[i] + 1) % N] = true;
        cnt--;
    }
    :: cnt == 0 ->
        break;
    od
    assert(cnt == 0);
}

init {
    int i = 0;
    array[0] = true;
    do
    :: i < N ->
        run proc(i);
        i++;
    :: else ->
        break;
    od
}

// ltl mutex { [] !(pc[0] == cs && pc[1] == cs) }
ltl lofree { [] ((pc[0] == ws) -> (<> (pc[0] == cs))) }
