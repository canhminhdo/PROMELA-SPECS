#define N   10	/* number of processes */

mtype = {ss, ws, cs, fs}
mtype pc[N] = ss
int cnt = N;
chan queue = [N] of { int }

active proctype proc0()
{
    do
	:: atomic {
        pc[0] == ss ->
        pc[0] = ws;
        queue!0;
    }
    :: atomic {
        pc[0] == ws; queue?<0>; ->
        pc[0] = cs;
    }
    :: atomic {
        pc[0] == cs ->
        queue?_;
        pc[0] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

active proctype proc1()
{
    do
	:: atomic {
        pc[1] == ss ->
        pc[1] = ws;
        queue!1;
    }
    :: atomic {
        pc[1] == ws; queue?<1>; ->
        pc[1] = cs;
    }
    :: atomic {
        pc[1] == cs ->
        queue?_;
        pc[1] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

active proctype proc2()
{
    do
	:: atomic {
        pc[2] == ss ->
        pc[2] = ws;
        queue!2;
    }
    :: atomic {
        pc[2] == ws; queue?<2>; ->
        pc[2] = cs;
    }
    :: atomic {
        pc[2] == cs ->
        queue?_;
        pc[2] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

active proctype proc3()
{
    do
	:: atomic {
        pc[3] == ss ->
        pc[3] = ws;
        queue!3;
    }
    :: atomic {
        pc[3] == ws; queue?<3>; ->
        pc[3] = cs;
    }
    :: atomic {
        pc[3] == cs ->
        queue?_;
        pc[3] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

active proctype proc4()
{
    do
	:: atomic {
        pc[4] == ss ->
        pc[4] = ws;
        queue!4;
    }
    :: atomic {
        pc[4] == ws; queue?<4>; ->
        pc[4] = cs;
    }
    :: atomic {
        pc[4] == cs ->
        queue?_;
        pc[4] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

active proctype proc5()
{
    do
	:: atomic {
        pc[5] == ss ->
        pc[5] = ws;
        queue!5;
    }
    :: atomic {
        pc[5] == ws; queue?<5>; ->
        pc[5] = cs;
    }
    :: atomic {
        pc[5] == cs ->
        queue?_;
        pc[5] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

active proctype proc6()
{
    do
	:: atomic {
        pc[6] == ss ->
        pc[6] = ws;
        queue!6;
    }
    :: atomic {
        pc[6] == ws; queue?<6>; ->
        pc[6] = cs;
    }
    :: atomic {
        pc[6] == cs ->
        queue?_;
        pc[6] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

active proctype proc7()
{
    do
	:: atomic {
        pc[7] == ss ->
        pc[7] = ws;
        queue!7;
    }
    :: atomic {
        pc[7] == ws; queue?<7>; ->
        pc[7] = cs;
    }
    :: atomic {
        pc[7] == cs ->
        queue?_;
        pc[7] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

active proctype proc8()
{
    do
	:: atomic {
        pc[8] == ss ->
        pc[8] = ws;
        queue!8;
    }
    :: atomic {
        pc[8] == ws; queue?<8>; ->
        pc[8] = cs;
    }
    :: atomic {
        pc[8] == cs ->
        queue?_;
        pc[8] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

active proctype proc9()
{
    do
	:: atomic {
        pc[9] == ss ->
        pc[9] = ws;
        queue!9;
    }
    :: atomic {
        pc[9] == ws; queue?<9>; ->
        pc[9] = cs;
    }
    :: atomic {
        pc[9] == cs ->
        queue?_;
        pc[9] = fs;
        cnt--;
    }
    :: cnt == 0 ->
        break
    od
    assert(cnt == 0)
}

// ltl mutex { [] !(pc[0] == cs && pc[1] == cs) }
// ltl lofree { [] ((pc[0] == ws) -> (<> (pc[0] == cs))) }
