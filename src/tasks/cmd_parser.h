
#line 1 "src/tasks/cmd_parser.ragel"

#line 5 "src/tasks/cmd_parser.h"
static const int train_cmd_start = 1;
static const int train_cmd_first_final = 17;
static const int train_cmd_error = 0;

static const int train_cmd_en_main = 1;


#line 4 "src/tasks/cmd_parser.ragel"


static inline int parse_cmd(char *cmd, struct A0_model_message *msg)
{
	int cs;
	char *p = cmd;
	char *pe;
	for (pe = p; *pe; ++pe);
	char *eof = pe;
	int num1, num2;
	num1 = num2 = 0;
	msg->code = CODE_Command;

	
#line 28 "src/tasks/cmd_parser.h"
	{
	cs = train_cmd_start;
	}

#line 33 "src/tasks/cmd_parser.h"
	{
	if ( p == pe )
		goto _test_eof;
	switch ( cs )
	{
st1:
	if ( ++p == pe )
		goto _test_eof1;
case 1:
	switch( (*p) ) {
		case 32: goto st1;
		case 76: goto st2;
		case 81: goto st18;
		case 82: goto st4;
		case 83: goto st7;
		case 84: goto st12;
		case 108: goto st2;
		case 113: goto st18;
		case 114: goto st4;
		case 115: goto st7;
		case 116: goto st12;
	}
	goto tr0;
tr0:
#line 49 "src/tasks/cmd_parser.ragel"
	{dprintf("Error on symbol: %c\n\r", *p); return 0;}
	goto st0;
#line 61 "src/tasks/cmd_parser.h"
st0:
cs = 0;
	goto _out;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
	if ( (*p) == 32 )
		goto st3;
	goto tr0;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
	if ( (*p) == 32 )
		goto st3;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr8;
	goto tr0;
tr8:
#line 18 "src/tasks/cmd_parser.ragel"
	{ num1 *= 10; num1 += (*p) - '0'; }
	goto st17;
st17:
	if ( ++p == pe )
		goto _test_eof17;
case 17:
#line 89 "src/tasks/cmd_parser.h"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr8;
	goto tr0;
st18:
	if ( ++p == pe )
		goto _test_eof18;
case 18:
	goto tr0;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
	switch( (*p) ) {
		case 86: goto st5;
		case 118: goto st5;
	}
	goto tr0;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
	if ( (*p) == 32 )
		goto st6;
	goto tr0;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
	if ( (*p) == 32 )
		goto st6;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr11;
	goto tr0;
tr11:
#line 18 "src/tasks/cmd_parser.ragel"
	{ num1 *= 10; num1 += (*p) - '0'; }
	goto st19;
st19:
	if ( ++p == pe )
		goto _test_eof19;
case 19:
#line 131 "src/tasks/cmd_parser.h"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr11;
	goto tr0;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
	switch( (*p) ) {
		case 87: goto st8;
		case 119: goto st8;
	}
	goto tr0;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
	if ( (*p) == 32 )
		goto st9;
	goto tr0;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
	if ( (*p) == 32 )
		goto st9;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr14;
	goto tr0;
tr14:
#line 18 "src/tasks/cmd_parser.ragel"
	{ num1 *= 10; num1 += (*p) - '0'; }
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
#line 168 "src/tasks/cmd_parser.h"
	if ( (*p) == 32 )
		goto st11;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr14;
	goto tr0;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
	switch( (*p) ) {
		case 32: goto st11;
		case 67: goto tr16;
		case 83: goto tr16;
		case 99: goto tr16;
		case 115: goto tr16;
	}
	goto tr0;
tr16:
#line 22 "src/tasks/cmd_parser.ragel"
	{num2 = (*p);}
	goto st20;
st20:
	if ( ++p == pe )
		goto _test_eof20;
case 20:
#line 194 "src/tasks/cmd_parser.h"
	goto tr0;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	switch( (*p) ) {
		case 82: goto st13;
		case 114: goto st13;
	}
	goto tr0;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
	if ( (*p) == 32 )
		goto st14;
	goto tr0;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
	if ( (*p) == 32 )
		goto st14;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr19;
	goto tr0;
tr19:
#line 18 "src/tasks/cmd_parser.ragel"
	{ num1 *= 10; num1 += (*p) - '0'; }
	goto st15;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
#line 229 "src/tasks/cmd_parser.h"
	if ( (*p) == 32 )
		goto st16;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr19;
	goto tr0;
st16:
	if ( ++p == pe )
		goto _test_eof16;
case 16:
	if ( (*p) == 32 )
		goto st16;
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr21;
	goto tr0;
tr21:
#line 19 "src/tasks/cmd_parser.ragel"
	{ num2 *= 10; num2 += (*p) - '0'; }
	goto st21;
st21:
	if ( ++p == pe )
		goto _test_eof21;
case 21:
#line 252 "src/tasks/cmd_parser.h"
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr21;
	goto tr0;
	}
	_test_eof1: cs = 1; goto _test_eof; 
	_test_eof2: cs = 2; goto _test_eof; 
	_test_eof3: cs = 3; goto _test_eof; 
	_test_eof17: cs = 17; goto _test_eof; 
	_test_eof18: cs = 18; goto _test_eof; 
	_test_eof4: cs = 4; goto _test_eof; 
	_test_eof5: cs = 5; goto _test_eof; 
	_test_eof6: cs = 6; goto _test_eof; 
	_test_eof19: cs = 19; goto _test_eof; 
	_test_eof7: cs = 7; goto _test_eof; 
	_test_eof8: cs = 8; goto _test_eof; 
	_test_eof9: cs = 9; goto _test_eof; 
	_test_eof10: cs = 10; goto _test_eof; 
	_test_eof11: cs = 11; goto _test_eof; 
	_test_eof20: cs = 20; goto _test_eof; 
	_test_eof12: cs = 12; goto _test_eof; 
	_test_eof13: cs = 13; goto _test_eof; 
	_test_eof14: cs = 14; goto _test_eof; 
	_test_eof15: cs = 15; goto _test_eof; 
	_test_eof16: cs = 16; goto _test_eof; 
	_test_eof21: cs = 21; goto _test_eof; 

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 21: 
#line 23 "src/tasks/cmd_parser.ragel"
	{
			msg->command.type = A0TYPE_SetSpeed;
			msg->command.args.speed.train = num1;
			msg->command.args.speed.speed = num2;
		}
	break;
	case 19: 
#line 28 "src/tasks/cmd_parser.ragel"
	{
			msg->command.type = A0TYPE_Reverse;
			msg->command.args.reverse.train = num1;
		}
	break;
	case 20: 
#line 32 "src/tasks/cmd_parser.ragel"
	{
			msg->command.type = A0TYPE_SwitchFlip;
			msg->command.args.flip.number = num1;
			msg->command.args.flip.state = (num2 > 'Z' ? num2 - ('a' - 'A') : num2);
		}
	break;
	case 18: 
#line 37 "src/tasks/cmd_parser.ragel"
	{
			msg->command.type = A0TYPE_Quit;
		}
	break;
	case 17: 
#line 40 "src/tasks/cmd_parser.ragel"
	{
			msg->command.type = A0TYPE_Headlights;
			msg->command.args.lights.train = num1;
		}
	break;
	case 1: 
	case 2: 
	case 3: 
	case 4: 
	case 5: 
	case 6: 
	case 7: 
	case 8: 
	case 9: 
	case 10: 
	case 11: 
	case 12: 
	case 13: 
	case 14: 
	case 15: 
	case 16: 
#line 49 "src/tasks/cmd_parser.ragel"
	{dprintf("Error on symbol: %c\n\r", *p); return 0;}
	break;
#line 338 "src/tasks/cmd_parser.h"
	}
	}

	_out: {}
	}

#line 52 "src/tasks/cmd_parser.ragel"


	return 1;
}
