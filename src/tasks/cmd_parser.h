

static const int train_cmd_start = 1;
static const int train_cmd_first_final = 11;
static const int train_cmd_error = 0;

static const int train_cmd_en_main = 1;




static inline void parse_cmd(char *cmd, struct A0_model_message *msg)
{
	int cs;
	char *p = cmd;
	char *pe;
	for (pe = p; *pe; ++pe);
	char *eof = pe;
	int num1, num2;
	num1 = num2 = 0;
	msg->code = CODE_Command;


	{
	cs = train_cmd_start;
	}

	{
	if ( p == pe )
		goto _test_eof;
	switch ( cs )
	{
case 1:
	switch( (*p) ) {
		case 76: goto st2;
		case 81: goto st12;
		case 82: goto st3;
		case 83: goto st5;
		case 84: goto st8;
		case 108: goto st2;
		case 113: goto st12;
		case 114: goto st3;
		case 115: goto st5;
		case 116: goto st8;
	}
	goto st0;
st0:
cs = 0;
	goto _out;
st2:
	if ( ++p == pe )
		goto _test_eof2;
case 2:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr6;
	goto st0;
tr6:
	{ num1 *= 10; num1 += (*p) - '0'; }
	goto st11;
st11:
	if ( ++p == pe )
		goto _test_eof11;
case 11:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr6;
	goto st0;
st12:
	if ( ++p == pe )
		goto _test_eof12;
case 12:
	goto st0;
st3:
	if ( ++p == pe )
		goto _test_eof3;
case 3:
	switch( (*p) ) {
		case 86: goto st4;
		case 118: goto st4;
	}
	goto st0;
st4:
	if ( ++p == pe )
		goto _test_eof4;
case 4:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr8;
	goto st0;
tr8:
	{ num1 *= 10; num1 += (*p) - '0'; }
	goto st13;
st13:
	if ( ++p == pe )
		goto _test_eof13;
case 13:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr8;
	goto st0;
st5:
	if ( ++p == pe )
		goto _test_eof5;
case 5:
	switch( (*p) ) {
		case 87: goto st6;
		case 119: goto st6;
	}
	goto st0;
st6:
	if ( ++p == pe )
		goto _test_eof6;
case 6:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr10;
	goto st0;
tr10:
	{ num1 *= 10; num1 += (*p) - '0'; }
	goto st7;
st7:
	if ( ++p == pe )
		goto _test_eof7;
case 7:
	switch( (*p) ) {
		case 67: goto tr11;
		case 83: goto tr11;
		case 99: goto tr11;
		case 115: goto tr11;
	}
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr10;
	goto st0;
tr11:
	{num2 = (*p);}
	goto st14;
st14:
	if ( ++p == pe )
		goto _test_eof14;
case 14:
	goto st0;
st8:
	if ( ++p == pe )
		goto _test_eof8;
case 8:
	switch( (*p) ) {
		case 82: goto st9;
		case 114: goto st9;
	}
	goto st0;
st9:
	if ( ++p == pe )
		goto _test_eof9;
case 9:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr13;
	goto st0;
tr13:
	{ num1 *= 10; num1 += (*p) - '0'; }
	goto st10;
st10:
	if ( ++p == pe )
		goto _test_eof10;
case 10:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr14;
	goto st0;
tr14:
	{ num1 *= 10; num1 += (*p) - '0'; }
	{ num2 *= 10; num2 += (*p) - '0'; }
	goto st15;
st15:
	if ( ++p == pe )
		goto _test_eof15;
case 15:
	if ( 48 <= (*p) && (*p) <= 57 )
		goto tr14;
	goto st0;
	}
	_test_eof2: cs = 2; goto _test_eof;
	_test_eof11: cs = 11; goto _test_eof;
	_test_eof12: cs = 12; goto _test_eof;
	_test_eof3: cs = 3; goto _test_eof;
	_test_eof4: cs = 4; goto _test_eof;
	_test_eof13: cs = 13; goto _test_eof;
	_test_eof5: cs = 5; goto _test_eof;
	_test_eof6: cs = 6; goto _test_eof;
	_test_eof7: cs = 7; goto _test_eof;
	_test_eof14: cs = 14; goto _test_eof;
	_test_eof8: cs = 8; goto _test_eof;
	_test_eof9: cs = 9; goto _test_eof;
	_test_eof10: cs = 10; goto _test_eof;
	_test_eof15: cs = 15; goto _test_eof;

	_test_eof: {}
	if ( p == eof )
	{
	switch ( cs ) {
	case 15:
	{msg->command.type = A0TYPE_SetSpeed; msg->command.args.speed.train = num1; msg->command.args.speed.speed = num2; }
	break;
	case 13:
	{msg->command.type = A0TYPE_Reverse; msg->command.args.reverse.train = num1; }
	break;
	case 14:
	{msg->command.type = A0TYPE_SwitchFlip; msg->command.args.flip.number = num1; msg->command.args.flip.state = num2; }
	break;
	case 12:
	{msg->command.type = A0TYPE_Quit;}
	break;
	case 11:
	{msg->command.type = A0TYPE_Headlights; msg->command.args.lights.train = num1;}
	break;
	}
	}

	_out: {}
	}


}
