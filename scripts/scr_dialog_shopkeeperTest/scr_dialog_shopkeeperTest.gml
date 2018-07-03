var leaveCall = false;

with CutsceneManager switch dialogCurrentType
{
	case dialogType.choice:
		switch dialogIndexSub
		{
			case 0: #region Initial choice
				switch response
				{
					case 0: //"Proc for small dialog text."
						dialogIndexSub = 0;
						dialogTextID = 0;
						dialogCurrentType = dialogType.speech;
						break;
					case 1: //"Proc for large dialog text."
						dialogIndexSub = 1;
						dialogTextID = 0;
						dialogCurrentType = dialogType.speech;
						break;
					case 2: //"Proc for math problem."
						dialogIndexSub = 2;
						dialogTextID = 0;
						dialogCurrentType = dialogType.speech;
						var cache = DialogCache.dialog[| dialogIndex];
						var subCache = cache[| dialogIndexSub];
						subCache[| 0] = "Answer this equation: ";
										
						var num1 = irandom(9)+1;
						var num2 = irandom(9)+1;
						var operation = irandom(2);
						var answer;
						switch operation
						{	
							case 0: subCache[| 0] += string(num1)+" + "+string(num2)+ " = ?"; answer = num1+num2; break;
							case 1: subCache[| 0] += string(num1)+" - "+string(num2)+ " = ?"; answer = num1-num2; break;
							case 2: subCache[| 0] += string(num1)+" * "+string(num2)+ " = ?"; answer = num1*num2; break;
						}
										
						cache = DialogCache.data[| dialogIndex];
						cache[| 0] = answer;
										
						cache = DialogCache.choices[| dialogIndex];
						var subCache = cache[| 1]; //math choices cache
						var ansInd = irandom(9);
						for(var i = 0; i < 10; i++)
						{
							var rep = true;
							if i == ansInd
							{
								rep = false;
								subCache[| i] = string(answer);
							}
							while(rep)
							{
								var num = 0;
								num = round(random_range(-10,10)*answer);
								if ds_list_find_index(subCache,num) == -1 && num != answer
								{
									subCache[| i] = string(num);
									rep = false;
								}
							}
						}
						break;
					case 3: //"Leave"
						leaveCall = true;
						break;
				}
				break;
				#endregion
			case 1: #region Math Response
				var cache = DialogCache.choices[| dialogIndex];
				var subCache = cache[| dialogIndexSub];
				response = int64(subCache[| response]);
				cache = DialogCache.data[| dialogIndex];
				answer = cache[| 0]; //equation answer
				dialogTextID = 0;
				dialogCurrentType = dialogType.speech;
				if response == answer dialogIndexSub = 3;
				else dialogIndexSub = 4;
				break;
			#endregion
		}
		break;
	case dialogType.speech:
		switch dialogIndexSub
		{
			case 0: #region Small Dialog: return to initial
				dialogIndexSub = 0;
				dialogTextID = 0;
				dialogCurrentType = dialogType.choice;
				break;
			#endregion
			case 1: #region Large Dialog: return to initial
				dialogIndexSub = 0;
				dialogTextID = 0;
				dialogCurrentType = dialogType.choice;
				break;
			#endregion
			case 2: #region Math Problem: go to answer choice
				dialogIndexSub = 1;
				dialogTextID = 0;
				dialogCurrentType = dialogType.choice;
				break;
			#endregion
			case 3: #region Math Problem: Correct response
				dialogIndexSub = 0;
				dialogTextID = 0;
				dialogCurrentType = dialogType.choice;
				break;
			#endregion
			case 4: #region Math Problem: Failure response
				dialogIndexSub = 0;
				dialogTextID = 0;
				dialogCurrentType = dialogType.choice;
				break;
			#endregion
		}
		break;
}

return leaveCall;