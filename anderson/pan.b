	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM lofree */
;
		;
		;
		;
		
	case 5: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 6: // STATE 1
		;
		now.array[0] = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: // STATE 4
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 12: // STATE 7
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 13: // STATE 8
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 14: // STATE 9
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 15: // STATE 10
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 16: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC proc */

	case 17: // STATE 4
		;
		now.next = trpt->bup.ovals[2];
		now.place[ Index(((P0 *)_this)->i, 9) ] = trpt->bup.ovals[1];
		now.pc[ Index(((P0 *)_this)->i, 9) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 18: // STATE 7
		;
		now.pc[ Index(((P0 *)_this)->i, 9) ] = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 13
		;
		now.cnt = trpt->bup.ovals[3];
		now.array[ Index(((now.place[ Index(((P0 *)_this)->i, 9) ]+1)%9), 9) ] = trpt->bup.ovals[2];
		now.array[ Index(now.place[ Index(((P0 *)_this)->i, 9) ], 9) ] = trpt->bup.ovals[1];
		now.pc[ Index(((P0 *)_this)->i, 9) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;
;
		;
		;
		;
		
	case 22: // STATE 21
		;
		p_restor(II);
		;
		;
		goto R999;
	}

