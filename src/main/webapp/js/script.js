
function add_to_cart(pid,pname,pprice){
    
    let cart=localStorage.getItem("cart");
    
    if(cart==null){
        //no cart
        let products=[];
        let product={productId:pid,productName:pname,productQuantity:1,productPrice:pprice};
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        //console.log("product is added for the first time");
        showToast("Item is added to cart");
    }
    else{
        //cart is already present
        
        let pcart=JSON.parse(cart);
        
        let oldProduct=pcart.find((item) => item.productId==pid);
        if(oldProduct){
            //we have to increase the quantity
            oldProduct.productQuantity=oldProduct.productQuantity+1;
            pcart.map((item) => {
                
                if(item.productId==oldProduct.productId){
                    item.productQuantity=oldProduct.productQuantity;
                    localStorage.setItem("cart",JSON.stringify(pcart));
                    //console.log("product quantity is increased");
                    showToast(oldProduct.productName+" Product quantity is increased");
                }
            });
            
        }
        else{
            //we have to add the product
            let product={productId:pid,productName:pname,productQuantity:1,productPrice:pprice};
            pcart.push(product);
            localStorage.setItem("cart",JSON.stringify(pcart));
            //console.log("product is added ");
            showToast("Product is added to cart");
        }
    }
    updateCart();
}

//update cart
function updateCart(){
    let cartString=localStorage.getItem("cart");
    let cart=JSON.parse(cartString);
    if(cart==null || cart.length==0){
        console.log("cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h5>Cart does not have any items </h5>");
        $(".checkout-btn").attr('disabled',true);
    }
    else{
        //There is something in the cart
        console.log(cart);
        $(".cart-items").html(`( ${cart.length})`);
        let table=`
            <table class='table'>
            <thead class='thead-light'>
                <tr>
                    <th>Item Name </th>
                    <th>Price </th>
                    <th>Quantity </th>
                    <th>Total Price </th>
                    <th>Action </th>
                
                </tr>
            </thead>
        
            
        `;
        let totalPrice=0;
        cart.map((item) =>{
           
            table+=`
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productQuantity} <a style="font-size:13px; cursor:pointer;">(+)</a> <a style="font-size:12px; cursor:pointer;">(-)</a></td>
                    <td>${item.productQuantity * item.productPrice}</td>
                    <td> <button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button> </td>
                </tr>

            `;
            totalPrice+=item.productPrice * item.productQuantity;
        });
        
        
        table=table+`
            <tr><td colspan='5' class='text-right font-weight-bold m-3' > Total Price : &#8377; ${totalPrice}</td></tr>
        </table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled',false);
    }
}


//Deleting item
function deleteItemFromCart(pid){
    let cart=JSON.parse(localStorage.getItem('cart'));
    
    let newCart=cart.filter((item) => item.productId!=pid);
    
    localStorage.setItem('cart',JSON.stringify(newCart));
    updateCart();
    showToast("Item is removed from the cart");
}


$(document).ready(function(){
    updateCart();
});


//toast

function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html((content));
    setTimeout(() => {
        $("#toast").removeClass("display");
    },2000);
}


//checkout
function goToCheckout(){
    window.location="checkout.jsp";
}

//continue shopping
function goToHome(){
    window.location="index.jsp";
}

//edit profile
function goToEditProfile(){
    window.location="profileEdit.jsp";
}

