% ---------------------------------------------------------------------
% Welcome and User Sign-In/Login Page  
% The data script must run first because everything start from here  
% This script is the main entry point for the Folliage system.
% It prompts users to log in if they already have an account,
% or register if they are new. User input is validated.
% ---------------------------------------------------------------------

fprintf(' --------------------------------------------------------------------- \n')

% Display a welcome message
fprintf('Welcome to Folliage \n');
fprintf('Branching Out to Newer Opportunities \n\n')

User = input('Do you have account with us?(yes/no) \n', 's');

% Loop to ensure valid input (either "yes" or "no" or empty)
while (~isempty(User) || isempty(User))

 if strcmpi(User,"yes")
    currentUser = LoginUser();
    break; % Exit the loop after successful login
 elseif strcmpi(currentUser,"no")
    currentUser = registerUser();
    break;% Exit the loop after successful registeration
 else
    fprintf(' \n Invalid input. Please enter only yes or no. \n')
    currentUser = input('Do you have account with us?(yes/no) \n', 's');
 end 
end  

    
% ---------------------------------------------------------------------
% Main Menu Section: Allows users to access core system features
% ---------------------------------------------------------------------

        
    userChoose = "";
         
 while(~isempty(userChoose) || isempty(userChoose))

    fprintf('\n\n--------------------------- Main Menu ---------------------------\n\n')


        disp('1  To search for Item')
        disp('2. Add Item to My list');
        disp('3. Edit My List');
        disp('4. View Cart & Checkout');
        disp('5. Exit');

userChoose = input("\n Please choose one of the following option above: " , 's');


    % -------------------- Option 1: Search for Item --------------------

% Calling filter function for user to search for an item
% if they want to purchase it then can do through this function 
% Or return to the main page 

   if(userChoose == "1")
       filterListings()
   

    % -------------------- Option 2: Add Items to List -----------------

% Calling Listing function 
% it alowws the user to add mutilple item to their list 
    

   elseif (userChoose == "2")

       % Start item entry process
        userChoice ="yes";

       items = {};

      % Loop to allow user to add multiple items
       while((strcmpi(userChoice,"yes"))) 
            newItem = addToMyList(); 
            items{end + 1} = newItem;
            userChoice = input('\n do you still want to add more item to your list: yes/no', 's');
       end

      % Save user's items into their data profile
       currentUser{5} = items;

           % Load existing user data
        load('userDataLists.mat', 'existData')

            % Load existing user data
       index = findUser(currentUser{1});
       existData{index} = currentUser;
       
       
       % Save updated user data
       save('userDataLists.mat', 'existData')
       

    % ---------------- Option 3: Edit or Remove Items -------------------

% his part of the program allows a registered user to either:
% Edit an existing item in their personal listing.
% Remove an item from their personal listing.


    % User chose to edit or remove items from their list

   elseif (userChoose == "3")
        disp(" ")
        disp('1. To Edit  item');
        disp('2. To Remove item');


           % Ask user whether they want to edit or remove
        userEditOrRemove = input("Please choose one of the following option above: " , 's');
        
          
        % Check if the user has any items in their list   
        if(isempty(currentUser{5}))
            fprintf("You don't have an item on your list to edit/remove: ")
            continue;
        end

    % Get number of items in the user's list
        len = length(currentUser{5});


            % Display each item in the list
        for i = 1:len
            % Display each item 
            fprintf('\n __________________%d__________________ \n \n', i);
            disp(currentUser{5}(i));
        end
    
           % Ask the user which item they want to edit or remove
        itemChoice = input("Please enter the number of the item you want to Edit/Remove: ");

        % Validate the input to make sure it's within range
        while( itemChoice > len)
        itemChoice = input("Please enter valid item number: ")
        end

         % Retrieve the user ID for use in function call
        userId = currentUser{1};
      

        % Loop until user provides a valid option (edit or remove)
      while(~isempty(userEditOrRemove) || isempty(userEditOrRemove) )

        if(userEditOrRemove == "1")
            editUserData('edit',itemChoice, userId);
            break;
        elseif (userEditOrRemove == "2")
            editUserData('remove',itemChoice,userId);
           break;
        else
            userEditOrRemove = input("Please enter a valid input 1 - 2: " , 's');
        end
      
      end


    % ------------------ Option 4: View Cart & Checkout -----------------

% this allow the user to check thier and check out
% call veiwCat function 

   elseif (userChoose == "4")
       viewCart()      
          
    % -------------------------- Option 5: Exit -------------------------

% if the user wants to exit the app 
% this break the loop 

   elseif (userChoose == "5")
       fprintf('\n Thank you!! ')
       break;

    % ------------------ Invalid Option Handling ------------------------

  
   else
    userChoose = input("Please enter a valid input 1 - 6: " , 's')
   end

end
        
fprintf('\n ------------------------- The End --------------------------------------------')
