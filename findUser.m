function index = findUser(userID) 

% Function: Find User 
% To find the user info in our database 

 % Define the filename where user data is stored
    filename = 'userDataLists.mat';

   % Check if the file exist & Load existing users' data or call for registration
   if isfile(filename)
     existingUsers = load(filename, 'existData', 'idCounter');
   
  end

 % Search for the User ID in the existing users' list & display it 
    for i = 1:existingUsers.idCounter
      user = existingUsers.existData{i};
      if ~isempty(find(strcmpi(user{1}, userID)));    
         index = i;
         return;
     end
    end
    
     % If no matching user is found, prompt for re-entry or registration 
     index = 0;
end
