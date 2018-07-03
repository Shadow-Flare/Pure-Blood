var leaveCall = false;

with CutsceneManager switch dialogCurrentType
{
	case dialogType.choice:	//none
		break;
	case dialogType.speech:
		switch dialogIndexSub
		{
			case 0: #region Failure Dialog => end
				leaveCall = true;
				break;
			#endregion
			case 1: #region Success Dialog => end
				leaveCall = true;
				break;
			#endregion
		}
		break;
}

return leaveCall;