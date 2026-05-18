function addItemToCart(index)

	% Function Add Item
    % To add an item to the cart
	
    % Load existing user data and cart information
    load('userDataLists.mat', 'existData', 'cartCounter', 'cart', 'idCounter');


   % Retrieve user data based on the provided index
while(1 > index  || index > idCounter)
    index = input('Please enter valid index: ')
end 


    cartCounter = cartCounter + 1;


    user = existData{index};

	% Check if the item exists before adding it to the cart

	 if(~isempty(user{5}))
           cart{cartCounter,1} = user;
            fprintf('successfully Added to Cart!');
            
       else
           fprintf('Item does not Exist!');	
     end

    % Save the updated date to the file 
     save('userDataLists.mat', 'existData', 'cartCounter', 'cart', 'idCounter')

end
 
