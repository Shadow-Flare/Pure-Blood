dialog = ds_list_create();
choices = ds_list_create();
data = ds_list_create();
scripts = ds_list_create();
var cache;
var cacheSub;
var tmp = 0;
var tmp2 = 0;

#region 0: Test dialog with shopkeeper
//tmp++;
	#region Data
	data[| tmp] = ds_list_create(); 
	cache = data[| tmp];
		cache[| 0] = noone;	//equation answer;
	#endregion
	
	#region Dialog
	dialog[| tmp] = ds_list_create();
	cache = dialog[| tmp];
	
	tmp2=0;
	cache[| tmp2] = ds_list_create(); #region 0: Small text
	cacheSub = cache[| tmp2];
		cacheSub[| 0] = "This is some small dialog text.";
		#endregion
	tmp2++;
	cache[| tmp2] = ds_list_create(); #region 1: Large text
	cacheSub = cache[| tmp2];
		cacheSub[| 0] = "Have some Lorem ipsum (you can skip the text scroll by pressing A): Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vestibulum sed magna in laoreet. Donec blandit iaculis massa. Duis a efficitur quam. Curabitur iaculis nec ligula ac elementum. Aliquam at porttitor justo, in finibus ex. Nullam vitae massa justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et massa a erat euismod tincidunt sit amet sed nisl. Integer vitae metus scelerisque, sodales eros at, mollis ante. Sed a lorem velit. Donec at purus ut augue aliquet iaculis at sit amet leo. Donec a magna quis sem aliquet dignissim. Pellentesque vitae lorem at nisi dignissim vulputate.";
		cacheSub[| 1] = "Also, seperate sequential dialog can be used, so here you go."
		#endregion
	tmp2++;
	cache[| tmp2] = ds_list_create(); #region 2: Math problem
	cacheSub = cache[| tmp2];
		cacheSub[| 0] = "" //empty, gets filled
		#endregion
	tmp2++;
	cache[| tmp2] = ds_list_create(); #region 3: Math success
	cacheSub = cache[| tmp2];
		cacheSub[| 0] = "You got it right!";
		#endregion
	tmp2++;
	cache[| tmp2] = ds_list_create(); #region 4: Math failure
	cacheSub = cache[| tmp2];
		cacheSub[| 0] = "WRONG!";
		#endregion
	#endregion
	
	#region Choices
	choices[| tmp] = ds_list_create();
	cache = choices[| tmp];
	
	tmp2=0;
	cache[| tmp2] = ds_list_create(); #region Initial choice
	cacheSub = cache[| tmp2];
		cacheSub[| 0] = "I would like to hear some small amount of text.";
		cacheSub[| 1] = "Large amount of text please.";
		cacheSub[| 2] = "Gimme a math problem.";
		cacheSub[| 3] = "Leave.";
		#endregion
	tmp2++;
	cache[| tmp2] = ds_list_create(); #region Math problem
	cacheSub = cache[| tmp2];
		//empty, gets filled
		#endregion
	
	#endregion
	
	scripts[| tmp] = scr_dialog_shopkeeperTest;
#endregion
#region 1: Test dialog during end of first town cutscene
tmp++;
	#region Data	//none
	data[| tmp] = ds_list_create(); 
	#endregion
	
	#region Dialog
	dialog[| tmp] = ds_list_create();
	cache = dialog[| tmp];
	
	tmp2=0;
		#region 0: Player Failed dialogue
	//tmp2++;
	cache[| tmp2] = ds_list_create(); 
	cacheSub = cache[| tmp2];
		cacheSub[| 0] = "This one was fighting the beast, matches the description of the man's daughter.";
		cacheSub[| 1] = "Get the girl off the street. And consecrate that carcass before the rabble get out of their hovels and get themselves killed..";
		#endregion
		#region 1: Player Success dialogue
	tmp2++;
	cache[| tmp2] = ds_list_create(); 
	cacheSub = cache[| tmp2];
		cacheSub[| 0] = "This one seems to have actually given that beast some trouble.";
		cacheSub[| 1] = "By herself? that cant be right...";
		cacheSub[| 2] = "Wait, she matches the description of the man's daughter.";
		cacheSub[| 3] = "Get the girl off the street. And consecrate that carcass before the rabble get out of their hovels and get themselves killed..";
		#endregion
	#endregion
	
	#region Choices	//none
	choices[| tmp] = ds_list_create();
	#endregion
	
	scripts[| tmp] = scr_dialog_townFirstEncounter;
#endregion