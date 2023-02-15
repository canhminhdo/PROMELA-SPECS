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
		reached[2][1] = 1;
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
		reached[2][8] = 1;
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
		reached[2][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 6: // STATE 1 - anderson.pml:37 - [array[0] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.array[0]);
		now.array[0] = 1;
#ifdef VAR_RANGES
		logval("array[0]", ((int)now.array[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 2 - anderson.pml:38 - [(run proc(0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!(addproc(II, 1, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 3 - anderson.pml:39 - [(run proc(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		if (!(addproc(II, 1, 0, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 4 - anderson.pml:40 - [(run proc(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!(addproc(II, 1, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 5 - anderson.pml:41 - [(run proc(3))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!(addproc(II, 1, 0, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 6 - anderson.pml:42 - [(run proc(4))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!(addproc(II, 1, 0, 4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 7 - anderson.pml:43 - [(run proc(5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		if (!(addproc(II, 1, 0, 5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 8 - anderson.pml:44 - [(run proc(6))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][8] = 1;
		if (!(addproc(II, 1, 0, 6)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 9 - anderson.pml:45 - [(run proc(7))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (!(addproc(II, 1, 0, 7)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 10 - anderson.pml:46 - [(run proc(8))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		if (!(addproc(II, 1, 0, 8)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 11 - anderson.pml:47 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC proc */
	case 17: // STATE 1 - anderson.pml:14 - [((pc[i]==rs))] (17:0:3 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((now.pc[ Index(((P0 *)_this)->i, 9) ]==4)))
			continue;
		/* merge: pc[i] = ws(17, 2, 17) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.pc[ Index(((P0 *)_this)->i, 9) ];
		now.pc[ Index(((P0 *)_this)->i, 9) ] = 3;
#ifdef VAR_RANGES
		logval("pc[proc:i]", now.pc[ Index(((P0 *)_this)->i, 9) ]);
#endif
		;
		/* merge: place[i] = next(17, 3, 17) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals[1] = now.place[ Index(((P0 *)_this)->i, 9) ];
		now.place[ Index(((P0 *)_this)->i, 9) ] = now.next;
#ifdef VAR_RANGES
		logval("place[proc:i]", now.place[ Index(((P0 *)_this)->i, 9) ]);
#endif
		;
		/* merge: next = ((next+1)%9)(17, 4, 17) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[2] = now.next;
		now.next = ((now.next+1)%9);
#ifdef VAR_RANGES
		logval("next", now.next);
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[0][18] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 18: // STATE 6 - anderson.pml:20 - [(((pc[i]==ws)&&(array[place[i]]==1)))] (17:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (!(((now.pc[ Index(((P0 *)_this)->i, 9) ]==3)&&(((int)now.array[ Index(now.place[ Index(((P0 *)_this)->i, 9) ], 9) ])==1))))
			continue;
		/* merge: pc[i] = cs(0, 7, 17) */
		reached[0][7] = 1;
		(trpt+1)->bup.oval = now.pc[ Index(((P0 *)_this)->i, 9) ];
		now.pc[ Index(((P0 *)_this)->i, 9) ] = 2;
#ifdef VAR_RANGES
		logval("pc[proc:i]", now.pc[ Index(((P0 *)_this)->i, 9) ]);
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[0][18] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 19: // STATE 9 - anderson.pml:24 - [((pc[i]==cs))] (17:0:4 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!((now.pc[ Index(((P0 *)_this)->i, 9) ]==2)))
			continue;
		/* merge: pc[i] = fs(17, 10, 17) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.pc[ Index(((P0 *)_this)->i, 9) ];
		now.pc[ Index(((P0 *)_this)->i, 9) ] = 1;
#ifdef VAR_RANGES
		logval("pc[proc:i]", now.pc[ Index(((P0 *)_this)->i, 9) ]);
#endif
		;
		/* merge: array[place[i]] = 0(17, 11, 17) */
		reached[0][11] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.array[ Index(now.place[ Index(((P0 *)_this)->i, 9) ], 9) ]);
		now.array[ Index(now.place[ Index(((P0 *)_this)->i, 9) ], 9) ] = 0;
#ifdef VAR_RANGES
		logval("array[place[proc:i]]", ((int)now.array[ Index(now.place[ Index(((P0 *)_this)->i, 9) ], 9) ]));
#endif
		;
		/* merge: array[((place[i]+1)%9)] = 1(17, 12, 17) */
		reached[0][12] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.array[ Index(((now.place[ Index(((P0 *)_this)->i, 9) ]+1)%9), 9) ]);
		now.array[ Index(((now.place[ Index(((P0 *)_this)->i, 9) ]+1)%9), 9) ] = 1;
#ifdef VAR_RANGES
		logval("array[((place[proc:i]+1)%9)]", ((int)now.array[ Index(((now.place[ Index(((P0 *)_this)->i, 9) ]+1)%9), 9) ]));
#endif
		;
		/* merge: cnt = (cnt-1)(17, 13, 17) */
		reached[0][13] = 1;
		(trpt+1)->bup.ovals[3] = now.cnt;
		now.cnt = (now.cnt-1);
#ifdef VAR_RANGES
		logval("cnt", now.cnt);
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[0][18] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 20: // STATE 15 - anderson.pml:30 - [((cnt==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][15] = 1;
		if (!((now.cnt==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 20 - anderson.pml:33 - [assert((cnt==0))] (0:0:0 - 3)
		IfNotBlocked
		reached[0][20] = 1;
		spin_assert((now.cnt==0), "(cnt==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 21 - anderson.pml:34 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][21] = 1;
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

