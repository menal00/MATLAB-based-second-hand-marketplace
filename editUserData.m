
function editUserData(inputUser1,inputUser2, userID)
 
   % Check if the file exist & Load existing users' data or call for registration
  
      load('userDataLists.mat', 'existData', 'cartCounter', 'cart', 'idCounter');
  
fprintf('--------------------------------------------------------------------- \n')
fprintf(' ---------- Edit User Profile Page ---------- \n') 

    index = findUser(userID);

    while(~isempty(index))
         if (index == 0)
           fprintf('\n User ID not found.\n');
           userID = input('\n Please enter valid user ID:  Type "r" to register \n', 's');
           index = findUser(userID);
         end 
         if(index >= 1)
             break;
         end 

         if(strcmpi(userID,"r"))
             registerUser();
             return;
         end
    end


    user = existData{index};

    switch lower(inputUser1)
       
        case 'edit'
            
        % Display current item information
        fprintf('Editing Item: %s\n', user{5}(inputUser2).name);
        fprintf('Leave input blank to keep the current value.\n\n');

            % Prompt for new name
            newName = input('\n New Name: ',  's');
            if ~isempty(newName)
                user{5}(inputUser2).name = newName;
            end
        

            % Prompt for new category
              newCategory = input('\n New Category [Electronics, Clothing, Furniture, Auto Care, Automotive, Beauty, Art]: ', 's');


         % Validate new  category input  
             while(~isempty(newCategory))
            
                    % Check if input matches one of the valid categories  
                      switch newCategory
            
                          case {"Electronics", "electronics"}
                              break;
                          case {"Clothing", "clothing" }
                             break;
                          case {"Furniture", "furniture"}
                              break;
                          case {"Auto Care", "auto Care", "auto care" , "autocare"}
                              break;
                          case {"Automotive", "automotive"}
                              break;
                          case {"Beauty", "beauty"}
                              break;
                          case {"Art", "art"}
                              break;
                          otherwise 
                            newCategory = input('\n Please enter a valid Category: [Electronics, Clothing, Furniture, Auto Care, Automotive, Beauty, Art]', 's');
                      end 
              end
            

            if ~isempty(newCategory)
                user{5}(inputUser2).category = newCategory;
            end


            % Prompt for new location
            newLocation = input('\n New Location: only [Toronto, Markham, Mississauga, Kingston, Brampton, Ottawa, Barrie]', 's');
           
       

            % Validate location input  
          while(~isempty(newLocation))
        
                  switch newLocation
        
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
                     newLocation = input('\n Enter a valid location: only [Toronto, Markham, Mississauga, Kingston, Brampton, Ottawa, Barrie]', 's');
        
                  end 
          end


            if ~isempty(newLocation)
                user{5}(inputUser2).location = newLocation;
            end



         % Prompt user for item condition  
        newCondition = input('\n Please enter the condition of this item: [New, Excellent, Good, Fair, Old]', 's');

    % Validate the condition input  
        while(~isempty(newCondition) )
        
        
        
                  switch newCondition
        
                      case {"New", "new"}
                          break;
                      case {"Excellent", "excellent" }
                         break;
                      case {"Good", "good"}
                          break;
                      case {"Fair", "fair"}
                          break;
                      case {"Old", "old"}
                          break;
        
                      otherwise 
                  newCondition = input('\n Enter a valid condition: only [New, Excellent, Good, Fair, Old]', 's');
        
                  end 
         end


            if ~isempty(newCondition)
                user{5}(inputUser2).price = newCondition;
            end






            % Prompt for new price
            newPrice = input('\n New Price: ');

            if ~isempty(newPrice)
                user{5}(inputUser2).price = newPrice;
            end


        
            % Prompt for new description
            newDescription = input('New Description: ', 's');

            if ~isempty(newDescription)
                user{5}(inputUser2).description = newDescription;
            end




            existData{index} = user;

            save('userDataLists.mat', 'existData', 'cartCounter', 'cart', 'idCounter');
            
           fprintf('Item successfully Edited.');
            return;

        case 'remove'

            user{5}(inputUser2) = [];
            existData{index} = user;

            fprintf('Item successfully Removed.');
           save('userDataLists.mat', 'existData', 'cartCounter', 'cart', 'idCounter');
                return;

    otherwise
       fprintf('Invalid Input. Type "edit" or "remove"');
           
    end
end





