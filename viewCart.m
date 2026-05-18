function viewCart()

    load('userDataLists.mat', 'cart', 'cartCounter');

    % Function to display the current cart items
    if isempty(cart)
      fprintf('\n Your Folliage cart is empty.');
      return;
        
    else
        fprintf('\n Your Folliage Cart:\n');

        len = cartCounter;
        
        for i = 1:len
            % Display each item 
            fprintf('\n __________________%d__________________ \n \n', i);
            disp(cart{i}{5});
        end
    end


    % Set up prompts for user input

    prompt1 = sprintf('Please enter the item number you want to buy ');
    prompt2 = sprintf('Please enter valid input, only between 1 to %d', len);


        % Ask the user if they want to purchase any item
   purchase = input('Would you like to purchase any  of this item (Y/N)', 's'); 
    
   
   
   % Loop while the user input is not handled properly
while(purchase)

    if(strcmpi(purchase, 'y'))

       userChoose = input(prompt1);

      % Loop to validate the input
      while(~isempty(userChoose) || isempty(userChoose))

      if(1 <= userChoose && userChoose <= len)
          % Call the checkout function with selected item
           checkout_Page(userChoose);
         return;
      else
   
          % Ask for valid input again

        userChoose = input(prompt2);
       end
       end
     
   % Exit if the user does not want to purchase
    elseif(strcmpi(purchase, 'n'))
        return;

        % Ask the user again if the input was not 'y' or 'n'
    else
    purchase = input('Please enter valid input. Y --> wants to purchase an item and N --> for no (Y/N)', 's'); 
    end

end 

end
