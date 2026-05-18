
function list = addToMyList() 

% Function: Add to My item List
% To allow users to add an item to their personal list


fprintf('--------------------------------------------------------------------- \n')
fprintf('------- Add Items To MyList Page ---------- \n')
 
    % Prompt user to enter the item name  
itemName = input('\n Please enter the item name', 's');

    % Ensure the item name is not empty  
    while(isempty(itemName ))
     itemName = input('\n Please enter a valid name: ', 's');
   end

    % Prompt user to enter the item category from a predefined list  
itemCategory = input('\n Please enter the Category of your item: [Electronics, Clothing, Furniture, Auto Care, Automotive, Beauty, Art]', 's');

    % Validate the category input  
 while(~isempty(itemCategory) || isempty(itemCategory))

      if(isempty(itemCategory))
          itemCategory = input('\n Please enter a valid Category: [Electronics, Clothing, Furniture, Auto Care, Automotive, Beauty, Art]', 's');
      end

        % Check if input matches one of the valid categories  
          switch itemCategory

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
                itemCategory = input('\n Please enter a valid Category: [Electronics, Clothing, Furniture, Auto Care, Automotive, Beauty, Art]', 's');
          end 
  end


    % Prompt user for item price  
itemPrice = input('Please enter the desired price for this item' , 's');
  
% Validate price input (ensure it is numeric)  
while(~isempty(itemPrice) || isempty(itemPrice))

    if(isempty(itemPrice))
     itemPrice = input('\n Please enter a valid price: ', 's');
    end
    if(isstrprop(itemPrice, 'digit'))
     itemPrice = str2double(itemPrice);
     break;
    else
    itemPrice = input('\n Please enter a valid price: ', 's');
    end

end

    % Prompt user for item condition  
itemCondition = input('\n Please enter the condition of this item: [New, Excellent, Good, Fair, Old]', 's');

    % Validate the condition input  
while(~isempty(itemCondition) || isempty(itemCondition))

      if(isempty(itemCondition))
          itemCondition = input('\n Enter a valid condition: only [New, Excellent, Good, Fair, Old]', 's');
      end

          switch itemCondition

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
          itemCondition = input('\n Enter a valid condition: only [New, Excellent, Good, Fair, Old]', 's');

          end 
 end


    % Prompt user for the item location  
itemLocation = input('Please enter the location for this item: only [Toronto, Markham, Mississauga, Kingston, Brampton, Ottawa, Barrie]', 's');

    % Validate location input  
  while(~isempty(itemLocation) || isempty(itemLocation))

      if(isempty(itemLocation))
          itemLocation = input('\n Enter a valid location: only [Toronto, Markham, Mississauga, Kingston, Brampton, Ottawa, Barrie]', 's');
      end

          switch itemLocation

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
          itemLocation = input('\n Enter a valid location: only [Toronto, Markham, Mississauga, Kingston, Brampton, Ottawa, Barrie]', 's');

          end 
  end



    % Prompt user for a short description of the item  
itemDescription = input('Please enter a short description of the item you are selling', 's');


    % Store item details in a structured format  and return it 
list = struct('Name',itemName, 'category', itemCategory, 'price', itemPrice, 'condition', itemCondition,'location', itemLocation , 'description',itemDescription);


end




