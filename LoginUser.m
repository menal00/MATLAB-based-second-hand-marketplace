function user = LoginUser()

    % Function: LoginUser
    % Purpose: Allows a user to log in by entering their User ID. 
    % If no users exist, call for registration.

    % Define the filename where user data is stored
    filename = 'userDataLists.mat';

   % Check if the file exist & Load existing users' data or call for registration
   if isfile(filename)
     existingUsers = load(filename, 'existData', 'idCounter');
   else
     fprintf('No users are registered yet. Please registerfirst.\n');
	user = registerUser();
	return;
    
  end
 
fprintf('--------------------------------------------------------------------- \n')
fprintf('------- Log In Page ---------- \n')

% Prompt the user to enter their unique User ID
userID = input('Please enter your unique UserID:' ,'s'); 

% Initialize index to track if the user exists
index = '0';


% Loop until a valid User ID is entered
while(true)

    % check if the user entered empty value
    if isempty(userID)
     disp('Id can not be empty:')
     userID = input('Please enter your unique UserID:' ,'s'); 
    continue; 
    end 

    % Search for the User ID in the existing users' list & display it 
    for i = 1:existingUsers.idCounter
      user = existingUsers.existData{i};
      if ~isempty(find(strcmpi(user{1}, userID)));
        index = i;
        fprintf('\nWelcome, %s. You have successfully log in!\n', user{2});
        fprintf('\nUser ID: %s \n', user{1});
        fprintf('\nPhone: %s \n', user{3});
        fprintf('\nLocation: %s \n\n', user{4});
        disp(user{5});
        return;
     end
   end

   
  % If no matching user is found, prompt for re-entry or registration 
  if (index == '0')
     fprintf('\nThe user ID you entered does not exist. \n');
     userID = input('Please choose 0 to register if you do not have account or forgot your Id \n or re-enter your ID if you type it wrong.' , 's');
  end


    % If the user chooses "0", redirect to registration
    if(userID == "0")
     user = registerUser();
     return;
    end 

  end

end 



