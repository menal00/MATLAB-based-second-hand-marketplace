function newUser = registerUser()
  
% Function: RegisterUser
% To register a new user


% Define the filename where user data is stored
filename = 'userDataLists.mat';

% Check if the file exists to load previous user data, otherwise initialize new data
if isfile(filename)
       load('userDataLists.mat', 'existData', 'cartCounter', 'cart', 'idCounter');
else
        idCounter = 30;
        existData = {};
end

 % Increment user ID counter for the new user
   idCounter = idCounter + 1;


fprintf('--------------------------------------------------------------------- \n')
fprintf('------- RegisterUser Page ---------- \n')

% Generate a unique user ID in the format "Uxxxx" 
   userID = sprintf('U%04d', idCounter); 

% Prompt user to enter their name
    name = input('\n Enter your name: ', 's');  

% Ensure the user enters a valid (non-empty) name
   while(isempty(name))
     name = input('\n Please enter a valid name: ', 's');
   end

% Prompt user to enter their phone number
    phone = input('\n Enter your phone number: ', 's');

% Validate that the phone number has exactly 10 digits
   while(length(phone) ~= 10 )
      phone = input('\n Enter a valid 10 digit phone number: ', 's');
    end
   
% Prompt user to enter their location from a predefined list
   location = input('\n Enter your location: [Toronto, Markham, Mississauga, Kingston, Brampton, Ottawa, Barrie]', 's');

   % Validate location input &  accept both upper and lower case
   while(~isempty(location) || isempty(location))

      if(isempty(location))
          location = input('\n Enter a valid location: only [Toronto, Markham, Mississauga, Kingston, Brampton, Ottawa, Barrie]', 's');
      end

          switch location

              case {"Toronto", "toronto"}
                  break;
              case {"Markham", "markham" }
                 break;
              case {"Mississauga", "mississauga"}
                  break;
              case {"Kingston", "kingston"}
                  break;
              case {"Brampton", "brampton"}
                  break;
              case {"Ottawa", "ottawa"}
                  break;
              case {"Barrie", "barrie"}
                  break;
              otherwise 
                location = input('\n Enter a valid location: only [Toronto, Markham, Mississauga, Kingston, Brampton, Ottawa, Barrie]', 's');

          end 
   end


 % Ask user if they want to add items to their list now       
userChoice = input('\n do you want to add an item to your list now: yes/no', 's');

% Initialize an empty list for items
items = {};


% Validate user's choice and handle item addition
while(~isempty(userChoice) || isempty(userChoice))

    % Check if input is empty
    if(isempty(userChoice))
     userChoice = input('\n Please enter valid input. \n yes to add item to your list or no to do it later', 's');

     % Case-insensitive check for "yes" & function to add an item
    elseif (strcmpi(userChoice,"yes"))
         while((strcmpi(userChoice,"yes"))) 
            newItem = addToMyList(); 
            items{end + 1} = newItem;
            userChoice = input('\n do you still want to add more item to your list: yes/no', 's');
         end
          
       % Case-insensitive check for "no"
     elseif (strcmpi(userChoice,"no"))
        break;

    else
      userChoice = input('\n Please enter valid input. \n yes to add item to your list or no to do it later', 's');
    end

end


% Store user information in a cell array
   newUser = {userID, name, phone, location, items};

   % Save updated user data to the file
    existData{idCounter} = newUser;
    save('userDataLists.mat', 'existData', 'cartCounter', 'cart', 'idCounter');
  
    % Display registration success message

   fprintf('\n You have successfully registered!\n');
   fprintf('\n User ID: %s\n', userID);
   fprintf('\n Name: %s\n', name);
   fprintf('\n Phone: %s\n', phone);
   fprintf('\n Location: %s\n', location);
   fprintf('\n User items: \n ');
   disp(items);
end


