#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM lofree */
	case 3: // STATE 1 - _spin_nvr.tmp:3 - [((!(!((pc[0]==ws)))&&!((pc[0]==cs))))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[10][1] = 1;
		if (!(( !( !((now.pc[0]==3)))&& !((now.pc[0]==2)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 8 - _spin_nvr.tmp:8 - [(!((pc[0]==cs)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[10][8] = 1;
		if (!( !((now.pc[0]==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 13 - _spin_nvr.tmp:10 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported13 = 0;
			if (verbose && !reported13)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported13 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[10][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc9 */
	case 6: // STATE 1 - qlock.pml:228 - [((pc[9]==ss))] (3:0:1 - 1)
		IfNotBlocked
		reached[9][1] = 1;
		if (!((now.pc[9]==4)))
			continue;
		/* merge: pc[9] = ws(0, 2, 3) */
		reached[9][2] = 1;
		(trpt+1)->bup.oval = now.pc[9];
		now.pc[9] = 3;
#ifdef VAR_RANGES
		logval("pc[9]", now.pc[9]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 7: // STATE 3 - qlock.pml:230 - [queue!9] (0:0:0 - 1)
		IfNotBlocked
		reached[9][3] = 1;
		if (q_full(now.queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.queue);
		sprintf(simtmp, "%d", 9); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.queue, 0, 9, 1);
		_m = 2; goto P999; /* 0 */
	case 8: // STATE 5 - qlock.pml:233 - [((pc[9]==ws))] (0:0:0 - 1)
		IfNotBlocked
		reached[9][5] = 1;
		if (!((now.pc[9]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 6 - qlock.pml:233 - [queue?<9>] (16:0:2 - 1)
		reached[9][6] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		if (9 != qrecv(now.queue, 0, 0, 0)) continue;
		;
		/* merge: pc[9] = cs(0, 7, 16) */
		reached[9][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[9];
		now.pc[9] = 2;
#ifdef VAR_RANGES
		logval("pc[9]", now.pc[9]);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[9][17] = 1;
		;
		_m = 4; goto P999; /* 2 */
	case 10: // STATE 9 - qlock.pml:237 - [((pc[9]==cs))] (0:0:0 - 1)
		IfNotBlocked
		reached[9][9] = 1;
		if (!((now.pc[9]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 10 - qlock.pml:238 - [queue?_] (16:0:3 - 1)
		reached[9][10] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = qrecv(now.queue, XX-1, 0, 0);
		;
		qrecv(now.queue, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.queue);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: pc[9] = fs(16, 11, 16) */
		reached[9][11] = 1;
		(trpt+1)->bup.ovals[1] = now.pc[9];
		now.pc[9] = 1;
#ifdef VAR_RANGES
		logval("pc[9]", now.pc[9]);
#endif
		;
		/* merge: cnt = (cnt-1)(16, 12, 16) */
		reached[9][12] = 1;
		(trpt+1)->bup.ovals[2] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[9][17] = 1;
		;
		_m = 4; goto P999; /* 3 */
	case 12: // STATE 14 - qlock.pml:242 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[9][14] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 19 - qlock.pml:245 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[9][19] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 20 - qlock.pml:246 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[9][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc8 */
	case 15: // STATE 1 - qlock.pml:204 - [((pc[8]==ss))] (3:0:1 - 1)
		IfNotBlocked
		reached[8][1] = 1;
		if (!((now.pc[8]==4)))
			continue;
		/* merge: pc[8] = ws(0, 2, 3) */
		reached[8][2] = 1;
		(trpt+1)->bup.oval = now.pc[8];
		now.pc[8] = 3;
#ifdef VAR_RANGES
		logval("pc[8]", now.pc[8]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 16: // STATE 3 - qlock.pml:206 - [queue!8] (0:0:0 - 1)
		IfNotBlocked
		reached[8][3] = 1;
		if (q_full(now.queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.queue);
		sprintf(simtmp, "%d", 8); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.queue, 0, 8, 1);
		_m = 2; goto P999; /* 0 */
	case 17: // STATE 5 - qlock.pml:209 - [((pc[8]==ws))] (0:0:0 - 1)
		IfNotBlocked
		reached[8][5] = 1;
		if (!((now.pc[8]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 6 - qlock.pml:209 - [queue?<8>] (16:0:2 - 1)
		reached[8][6] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		if (8 != qrecv(now.queue, 0, 0, 0)) continue;
		;
		/* merge: pc[8] = cs(0, 7, 16) */
		reached[8][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[8];
		now.pc[8] = 2;
#ifdef VAR_RANGES
		logval("pc[8]", now.pc[8]);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[8][17] = 1;
		;
		_m = 4; goto P999; /* 2 */
	case 19: // STATE 9 - qlock.pml:213 - [((pc[8]==cs))] (0:0:0 - 1)
		IfNotBlocked
		reached[8][9] = 1;
		if (!((now.pc[8]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 10 - qlock.pml:214 - [queue?_] (16:0:3 - 1)
		reached[8][10] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = qrecv(now.queue, XX-1, 0, 0);
		;
		qrecv(now.queue, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.queue);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: pc[8] = fs(16, 11, 16) */
		reached[8][11] = 1;
		(trpt+1)->bup.ovals[1] = now.pc[8];
		now.pc[8] = 1;
#ifdef VAR_RANGES
		logval("pc[8]", now.pc[8]);
#endif
		;
		/* merge: cnt = (cnt-1)(16, 12, 16) */
		reached[8][12] = 1;
		(trpt+1)->bup.ovals[2] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[8][17] = 1;
		;
		_m = 4; goto P999; /* 3 */
	case 21: // STATE 14 - qlock.pml:218 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[8][14] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 19 - qlock.pml:221 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[8][19] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 20 - qlock.pml:222 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[8][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc7 */
	case 24: // STATE 1 - qlock.pml:180 - [((pc[7]==ss))] (3:0:1 - 1)
		IfNotBlocked
		reached[7][1] = 1;
		if (!((now.pc[7]==4)))
			continue;
		/* merge: pc[7] = ws(0, 2, 3) */
		reached[7][2] = 1;
		(trpt+1)->bup.oval = now.pc[7];
		now.pc[7] = 3;
#ifdef VAR_RANGES
		logval("pc[7]", now.pc[7]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 25: // STATE 3 - qlock.pml:182 - [queue!7] (0:0:0 - 1)
		IfNotBlocked
		reached[7][3] = 1;
		if (q_full(now.queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.queue);
		sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.queue, 0, 7, 1);
		_m = 2; goto P999; /* 0 */
	case 26: // STATE 5 - qlock.pml:185 - [((pc[7]==ws))] (0:0:0 - 1)
		IfNotBlocked
		reached[7][5] = 1;
		if (!((now.pc[7]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 6 - qlock.pml:185 - [queue?<7>] (16:0:2 - 1)
		reached[7][6] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		if (7 != qrecv(now.queue, 0, 0, 0)) continue;
		;
		/* merge: pc[7] = cs(0, 7, 16) */
		reached[7][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[7];
		now.pc[7] = 2;
#ifdef VAR_RANGES
		logval("pc[7]", now.pc[7]);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[7][17] = 1;
		;
		_m = 4; goto P999; /* 2 */
	case 28: // STATE 9 - qlock.pml:189 - [((pc[7]==cs))] (0:0:0 - 1)
		IfNotBlocked
		reached[7][9] = 1;
		if (!((now.pc[7]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 10 - qlock.pml:190 - [queue?_] (16:0:3 - 1)
		reached[7][10] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = qrecv(now.queue, XX-1, 0, 0);
		;
		qrecv(now.queue, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.queue);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: pc[7] = fs(16, 11, 16) */
		reached[7][11] = 1;
		(trpt+1)->bup.ovals[1] = now.pc[7];
		now.pc[7] = 1;
#ifdef VAR_RANGES
		logval("pc[7]", now.pc[7]);
#endif
		;
		/* merge: cnt = (cnt-1)(16, 12, 16) */
		reached[7][12] = 1;
		(trpt+1)->bup.ovals[2] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[7][17] = 1;
		;
		_m = 4; goto P999; /* 3 */
	case 30: // STATE 14 - qlock.pml:194 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[7][14] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 19 - qlock.pml:197 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[7][19] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 20 - qlock.pml:198 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[7][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc6 */
	case 33: // STATE 1 - qlock.pml:156 - [((pc[6]==ss))] (3:0:1 - 1)
		IfNotBlocked
		reached[6][1] = 1;
		if (!((now.pc[6]==4)))
			continue;
		/* merge: pc[6] = ws(0, 2, 3) */
		reached[6][2] = 1;
		(trpt+1)->bup.oval = now.pc[6];
		now.pc[6] = 3;
#ifdef VAR_RANGES
		logval("pc[6]", now.pc[6]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 34: // STATE 3 - qlock.pml:158 - [queue!6] (0:0:0 - 1)
		IfNotBlocked
		reached[6][3] = 1;
		if (q_full(now.queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.queue);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.queue, 0, 6, 1);
		_m = 2; goto P999; /* 0 */
	case 35: // STATE 5 - qlock.pml:161 - [((pc[6]==ws))] (0:0:0 - 1)
		IfNotBlocked
		reached[6][5] = 1;
		if (!((now.pc[6]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 6 - qlock.pml:161 - [queue?<6>] (16:0:2 - 1)
		reached[6][6] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		if (6 != qrecv(now.queue, 0, 0, 0)) continue;
		;
		/* merge: pc[6] = cs(0, 7, 16) */
		reached[6][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[6];
		now.pc[6] = 2;
#ifdef VAR_RANGES
		logval("pc[6]", now.pc[6]);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[6][17] = 1;
		;
		_m = 4; goto P999; /* 2 */
	case 37: // STATE 9 - qlock.pml:165 - [((pc[6]==cs))] (0:0:0 - 1)
		IfNotBlocked
		reached[6][9] = 1;
		if (!((now.pc[6]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 10 - qlock.pml:166 - [queue?_] (16:0:3 - 1)
		reached[6][10] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = qrecv(now.queue, XX-1, 0, 0);
		;
		qrecv(now.queue, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.queue);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: pc[6] = fs(16, 11, 16) */
		reached[6][11] = 1;
		(trpt+1)->bup.ovals[1] = now.pc[6];
		now.pc[6] = 1;
#ifdef VAR_RANGES
		logval("pc[6]", now.pc[6]);
#endif
		;
		/* merge: cnt = (cnt-1)(16, 12, 16) */
		reached[6][12] = 1;
		(trpt+1)->bup.ovals[2] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[6][17] = 1;
		;
		_m = 4; goto P999; /* 3 */
	case 39: // STATE 14 - qlock.pml:170 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[6][14] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 40: // STATE 19 - qlock.pml:173 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[6][19] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 20 - qlock.pml:174 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[6][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc5 */
	case 42: // STATE 1 - qlock.pml:132 - [((pc[5]==ss))] (3:0:1 - 1)
		IfNotBlocked
		reached[5][1] = 1;
		if (!((now.pc[5]==4)))
			continue;
		/* merge: pc[5] = ws(0, 2, 3) */
		reached[5][2] = 1;
		(trpt+1)->bup.oval = now.pc[5];
		now.pc[5] = 3;
#ifdef VAR_RANGES
		logval("pc[5]", now.pc[5]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 43: // STATE 3 - qlock.pml:134 - [queue!5] (0:0:0 - 1)
		IfNotBlocked
		reached[5][3] = 1;
		if (q_full(now.queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.queue);
		sprintf(simtmp, "%d", 5); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.queue, 0, 5, 1);
		_m = 2; goto P999; /* 0 */
	case 44: // STATE 5 - qlock.pml:137 - [((pc[5]==ws))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][5] = 1;
		if (!((now.pc[5]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 45: // STATE 6 - qlock.pml:137 - [queue?<5>] (16:0:2 - 1)
		reached[5][6] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		if (5 != qrecv(now.queue, 0, 0, 0)) continue;
		;
		/* merge: pc[5] = cs(0, 7, 16) */
		reached[5][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[5];
		now.pc[5] = 2;
#ifdef VAR_RANGES
		logval("pc[5]", now.pc[5]);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[5][17] = 1;
		;
		_m = 4; goto P999; /* 2 */
	case 46: // STATE 9 - qlock.pml:141 - [((pc[5]==cs))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][9] = 1;
		if (!((now.pc[5]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 47: // STATE 10 - qlock.pml:142 - [queue?_] (16:0:3 - 1)
		reached[5][10] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = qrecv(now.queue, XX-1, 0, 0);
		;
		qrecv(now.queue, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.queue);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: pc[5] = fs(16, 11, 16) */
		reached[5][11] = 1;
		(trpt+1)->bup.ovals[1] = now.pc[5];
		now.pc[5] = 1;
#ifdef VAR_RANGES
		logval("pc[5]", now.pc[5]);
#endif
		;
		/* merge: cnt = (cnt-1)(16, 12, 16) */
		reached[5][12] = 1;
		(trpt+1)->bup.ovals[2] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[5][17] = 1;
		;
		_m = 4; goto P999; /* 3 */
	case 48: // STATE 14 - qlock.pml:146 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][14] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 49: // STATE 19 - qlock.pml:149 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[5][19] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 20 - qlock.pml:150 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[5][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc4 */
	case 51: // STATE 1 - qlock.pml:108 - [((pc[4]==ss))] (3:0:1 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!((now.pc[4]==4)))
			continue;
		/* merge: pc[4] = ws(0, 2, 3) */
		reached[4][2] = 1;
		(trpt+1)->bup.oval = now.pc[4];
		now.pc[4] = 3;
#ifdef VAR_RANGES
		logval("pc[4]", now.pc[4]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 52: // STATE 3 - qlock.pml:110 - [queue!4] (0:0:0 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		if (q_full(now.queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.queue);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.queue, 0, 4, 1);
		_m = 2; goto P999; /* 0 */
	case 53: // STATE 5 - qlock.pml:113 - [((pc[4]==ws))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][5] = 1;
		if (!((now.pc[4]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 6 - qlock.pml:113 - [queue?<4>] (16:0:2 - 1)
		reached[4][6] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		if (4 != qrecv(now.queue, 0, 0, 0)) continue;
		;
		/* merge: pc[4] = cs(0, 7, 16) */
		reached[4][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[4];
		now.pc[4] = 2;
#ifdef VAR_RANGES
		logval("pc[4]", now.pc[4]);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[4][17] = 1;
		;
		_m = 4; goto P999; /* 2 */
	case 55: // STATE 9 - qlock.pml:117 - [((pc[4]==cs))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][9] = 1;
		if (!((now.pc[4]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 56: // STATE 10 - qlock.pml:118 - [queue?_] (16:0:3 - 1)
		reached[4][10] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = qrecv(now.queue, XX-1, 0, 0);
		;
		qrecv(now.queue, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.queue);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: pc[4] = fs(16, 11, 16) */
		reached[4][11] = 1;
		(trpt+1)->bup.ovals[1] = now.pc[4];
		now.pc[4] = 1;
#ifdef VAR_RANGES
		logval("pc[4]", now.pc[4]);
#endif
		;
		/* merge: cnt = (cnt-1)(16, 12, 16) */
		reached[4][12] = 1;
		(trpt+1)->bup.ovals[2] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[4][17] = 1;
		;
		_m = 4; goto P999; /* 3 */
	case 57: // STATE 14 - qlock.pml:122 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][14] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 58: // STATE 19 - qlock.pml:125 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[4][19] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 59: // STATE 20 - qlock.pml:126 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc3 */
	case 60: // STATE 1 - qlock.pml:84 - [((pc[3]==ss))] (3:0:1 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		if (!((now.pc[3]==4)))
			continue;
		/* merge: pc[3] = ws(0, 2, 3) */
		reached[3][2] = 1;
		(trpt+1)->bup.oval = now.pc[3];
		now.pc[3] = 3;
#ifdef VAR_RANGES
		logval("pc[3]", now.pc[3]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 61: // STATE 3 - qlock.pml:86 - [queue!3] (0:0:0 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		if (q_full(now.queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.queue);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.queue, 0, 3, 1);
		_m = 2; goto P999; /* 0 */
	case 62: // STATE 5 - qlock.pml:89 - [((pc[3]==ws))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][5] = 1;
		if (!((now.pc[3]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 63: // STATE 6 - qlock.pml:89 - [queue?<3>] (16:0:2 - 1)
		reached[3][6] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		if (3 != qrecv(now.queue, 0, 0, 0)) continue;
		;
		/* merge: pc[3] = cs(0, 7, 16) */
		reached[3][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[3];
		now.pc[3] = 2;
#ifdef VAR_RANGES
		logval("pc[3]", now.pc[3]);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[3][17] = 1;
		;
		_m = 4; goto P999; /* 2 */
	case 64: // STATE 9 - qlock.pml:93 - [((pc[3]==cs))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][9] = 1;
		if (!((now.pc[3]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 65: // STATE 10 - qlock.pml:94 - [queue?_] (16:0:3 - 1)
		reached[3][10] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = qrecv(now.queue, XX-1, 0, 0);
		;
		qrecv(now.queue, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.queue);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: pc[3] = fs(16, 11, 16) */
		reached[3][11] = 1;
		(trpt+1)->bup.ovals[1] = now.pc[3];
		now.pc[3] = 1;
#ifdef VAR_RANGES
		logval("pc[3]", now.pc[3]);
#endif
		;
		/* merge: cnt = (cnt-1)(16, 12, 16) */
		reached[3][12] = 1;
		(trpt+1)->bup.ovals[2] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[3][17] = 1;
		;
		_m = 4; goto P999; /* 3 */
	case 66: // STATE 14 - qlock.pml:98 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][14] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 67: // STATE 19 - qlock.pml:101 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[3][19] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 68: // STATE 20 - qlock.pml:102 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc2 */
	case 69: // STATE 1 - qlock.pml:60 - [((pc[2]==ss))] (3:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!((now.pc[2]==4)))
			continue;
		/* merge: pc[2] = ws(0, 2, 3) */
		reached[2][2] = 1;
		(trpt+1)->bup.oval = now.pc[2];
		now.pc[2] = 3;
#ifdef VAR_RANGES
		logval("pc[2]", now.pc[2]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 70: // STATE 3 - qlock.pml:62 - [queue!2] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (q_full(now.queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.queue);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.queue, 0, 2, 1);
		_m = 2; goto P999; /* 0 */
	case 71: // STATE 5 - qlock.pml:65 - [((pc[2]==ws))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		if (!((now.pc[2]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 72: // STATE 6 - qlock.pml:65 - [queue?<2>] (16:0:2 - 1)
		reached[2][6] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		if (2 != qrecv(now.queue, 0, 0, 0)) continue;
		;
		/* merge: pc[2] = cs(0, 7, 16) */
		reached[2][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[2];
		now.pc[2] = 2;
#ifdef VAR_RANGES
		logval("pc[2]", now.pc[2]);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[2][17] = 1;
		;
		_m = 4; goto P999; /* 2 */
	case 73: // STATE 9 - qlock.pml:69 - [((pc[2]==cs))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][9] = 1;
		if (!((now.pc[2]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 74: // STATE 10 - qlock.pml:70 - [queue?_] (16:0:3 - 1)
		reached[2][10] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = qrecv(now.queue, XX-1, 0, 0);
		;
		qrecv(now.queue, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.queue);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: pc[2] = fs(16, 11, 16) */
		reached[2][11] = 1;
		(trpt+1)->bup.ovals[1] = now.pc[2];
		now.pc[2] = 1;
#ifdef VAR_RANGES
		logval("pc[2]", now.pc[2]);
#endif
		;
		/* merge: cnt = (cnt-1)(16, 12, 16) */
		reached[2][12] = 1;
		(trpt+1)->bup.ovals[2] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[2][17] = 1;
		;
		_m = 4; goto P999; /* 3 */
	case 75: // STATE 14 - qlock.pml:74 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][14] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 76: // STATE 19 - qlock.pml:77 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[2][19] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 77: // STATE 20 - qlock.pml:78 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc1 */
	case 78: // STATE 1 - qlock.pml:36 - [((pc[1]==ss))] (3:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((now.pc[1]==4)))
			continue;
		/* merge: pc[1] = ws(0, 2, 3) */
		reached[1][2] = 1;
		(trpt+1)->bup.oval = now.pc[1];
		now.pc[1] = 3;
#ifdef VAR_RANGES
		logval("pc[1]", now.pc[1]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 79: // STATE 3 - qlock.pml:38 - [queue!1] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (q_full(now.queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.queue);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.queue, 0, 1, 1);
		_m = 2; goto P999; /* 0 */
	case 80: // STATE 5 - qlock.pml:41 - [((pc[1]==ws))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!((now.pc[1]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 81: // STATE 6 - qlock.pml:41 - [queue?<1>] (16:0:2 - 1)
		reached[1][6] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		if (1 != qrecv(now.queue, 0, 0, 0)) continue;
		;
		/* merge: pc[1] = cs(0, 7, 16) */
		reached[1][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[1];
		now.pc[1] = 2;
#ifdef VAR_RANGES
		logval("pc[1]", now.pc[1]);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[1][17] = 1;
		;
		_m = 4; goto P999; /* 2 */
	case 82: // STATE 9 - qlock.pml:45 - [((pc[1]==cs))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (!((now.pc[1]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 83: // STATE 10 - qlock.pml:46 - [queue?_] (16:0:3 - 1)
		reached[1][10] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = qrecv(now.queue, XX-1, 0, 0);
		;
		qrecv(now.queue, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.queue);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: pc[1] = fs(16, 11, 16) */
		reached[1][11] = 1;
		(trpt+1)->bup.ovals[1] = now.pc[1];
		now.pc[1] = 1;
#ifdef VAR_RANGES
		logval("pc[1]", now.pc[1]);
#endif
		;
		/* merge: cnt = (cnt-1)(16, 12, 16) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals[2] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[1][17] = 1;
		;
		_m = 4; goto P999; /* 3 */
	case 84: // STATE 14 - qlock.pml:50 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 85: // STATE 19 - qlock.pml:53 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[1][19] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 86: // STATE 20 - qlock.pml:54 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc0 */
	case 87: // STATE 1 - qlock.pml:12 - [((pc[0]==ss))] (3:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((now.pc[0]==4)))
			continue;
		/* merge: pc[0] = ws(0, 2, 3) */
		reached[0][2] = 1;
		(trpt+1)->bup.oval = now.pc[0];
		now.pc[0] = 3;
#ifdef VAR_RANGES
		logval("pc[0]", now.pc[0]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 88: // STATE 3 - qlock.pml:14 - [queue!0] (0:0:0 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (q_full(now.queue))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.queue);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.queue, 0, 0, 1);
		_m = 2; goto P999; /* 0 */
	case 89: // STATE 5 - qlock.pml:17 - [((pc[0]==ws))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((now.pc[0]==3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 90: // STATE 6 - qlock.pml:17 - [queue?<0>] (16:0:2 - 1)
		reached[0][6] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		if (0 != qrecv(now.queue, 0, 0, 0)) continue;
		;
		/* merge: pc[0] = cs(0, 7, 16) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.pc[0];
		now.pc[0] = 2;
#ifdef VAR_RANGES
		logval("pc[0]", now.pc[0]);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[0][17] = 1;
		;
		_m = 4; goto P999; /* 2 */
	case 91: // STATE 9 - qlock.pml:21 - [((pc[0]==cs))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!((now.pc[0]==2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 92: // STATE 10 - qlock.pml:22 - [queue?_] (16:0:3 - 1)
		reached[0][10] = 1;
		if (q_len(now.queue) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = qrecv(now.queue, XX-1, 0, 0);
		;
		qrecv(now.queue, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.queue);
		sprintf(simtmp, "%d", ((int)_)); strcat(simvals, simtmp);		}
#endif
		;
		/* merge: pc[0] = fs(16, 11, 16) */
		reached[0][11] = 1;
		(trpt+1)->bup.ovals[1] = now.pc[0];
		now.pc[0] = 1;
#ifdef VAR_RANGES
		logval("pc[0]", now.pc[0]);
#endif
		;
		/* merge: cnt = (cnt-1)(16, 12, 16) */
		reached[0][12] = 1;
		(trpt+1)->bup.ovals[2] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[0][17] = 1;
		;
		_m = 4; goto P999; /* 3 */
	case 93: // STATE 14 - qlock.pml:26 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 94: // STATE 19 - qlock.pml:29 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[0][19] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 95: // STATE 20 - qlock.pml:30 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

