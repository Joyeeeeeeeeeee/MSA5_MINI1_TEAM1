
 /*상품페이지*/
 let cartIcon = document.querySelector("#cart-icon");
 let cart = document.querySelector(".cart");
 let closeCart = document.querySelector("#close-cart");

 
 // 문서 준비 이벤트
 $(function() {
	 cartIcon = document.querySelector("#cart-icon");
	 cart = document.querySelector(".cart");
	 closeCart = document.querySelector("#close-cart");
	 
	 //open cart
	 cartIcon.addEventListener('click', () => {
	     cart.classList.add("active");
	 });
	 //close cart
	 closeCart.addEventListener('click', () => {
	     cart.classList.remove("active");
	 })
 })
 
 
 
 //cart working
 if(document.readyState == 'loading'){
  document.addEventListener('DOMContentLoaded', ready);
 }else {
  ready();
 }
 //making funcion
 function ready() {
 	//remove items from cart
   var removeCartButtons = document.getElementsByClassName('cart-remove');
   console.log(removeCartButtons);
   for(var i = 0; i < removeCartButtons.length; i++) {
       var button = removeCartButtons[i];
       button.addEventListener('click', removeCartItem);
   }
     //quantity changes
     var quantityInputs = document.getElementsByClassName('cart-quantity');
     for(var i = 0; i < quantityInputs.length; i++){
     var input = quantityInputs[i];
     input.addEventListener('change', quantityChanged);   
   }
 	// add to cart
 	// ?
//	 var addCart = document.getElementsByClassName("add-cart");
//	 for( var i = 0; i < addCart.length; i++){
//	     var button = addCart[i];
//	    //  input.addEventListener("click", addCartClicked);
//	   }
	   //buy button work
//	   document
//	   .getElementsByClassName('btn-buy')[0]
//	   .addEventListener("click", buyButtonClicked);

	$(document).on("click",".cart-remove",function(){
		var bname = $(this).attr('data')
		// 장바구니에서 삭제
		cartRemove(bname);
	});
	
    $(".add-cart").on('click', function() {
	    var shopProducts = $(this).closest('.product-box');
	    
	    var isbn = $(this).attr('data')
	    var title = shopProducts.find(".product-title").text();
	    var price = shopProducts.find(".price").text();
	    var productImg = shopProducts.find(".product-img").attr('src');
	    console.log("img:"+productImg);
	    
	    // 장바구니 추가
		 addProductToCart(title, price, productImg);
	    
		// 세션에 상품 정보 등록
		addCart(isbn,1,productImg)
		
		
		// 합계 갱신			
	    // updatetotal();
	});



  }  
     // buy button
 function buyButtonClicked(){
    alert('your order is placed')
    var cartContent = document.getElementsByClassName('cart-content')[0];
    while(cartContent.hasChildNodes()) {
        cartContent.removeChild(cartContent.firstChild);
    }
    updatetotal();
 }
 // 카트에서 아이템 제거
 function removeCartItem(event){
    var buttonClicked = event.target;
    buttonClicked.parentElement.remove();
    updatetotal();
   }
   //quantity changes
function quantityChanged(event) {
    var input = event.target
    if(isNaN(input.value) || input.value <= 0){
        input.value = 1
    }
    updatetotal();
  }
// 카트에 더하기
function addCartClicked(event) {
    var button = event.target;
    var shopProducts = button.parentElement;
    var title = shopProducts.getElementsByClassName("product-title")[0].innerText;
    var price = shopProducts.getElementsByClassName("price")[0].innerText;
    var productImg = shopProducts.getElementsByClassName("product-img")[0].src;
    addProductToCart(title, price, productImg);
    updatetotal();
}
function addProductToCart(title, price, productImg){
	  var cartShopBox = document.createElement('div');
	  cartShopBox.classList.add('cart-box');
	  var cartItems = document.getElementsByClassName('cart-content')[0];
	  var cartItemsNames = cartItems.getElementsByClassName('cart-product-title');
	  
	  cartShopBox.id = title
	  
	   
	  let cartList = getCartList()
	  // alert(cartList)
	  if( cartList != undefined && cartList != 0 ) {
		  for(let i = 0 ; i < cartList.length ; i++) {
			  if( cartList[i].bname == title ) {
				  alert("이미 있슴미당");
				  const inputTotal = $('#' + title).children('.cart-quantity')
				  let total = inputTotal.val() + 1
				  inputTotal.val(total)
				  return false;
			  }
		  }
	  }
	  
//	  for (var i = 0; i < cartItemsNames.length; i++){
//		  // 이미 등록된 상품
//	      if(cartItemsNames[i].innerText == title){
//		   	// alert("You have already add this item to cart");
//		    const inputTotal = $('#' + title).children('.cart-quantity')
//		    let total = inputTotal.val() + 1
//		    inputTotal.val(total)
//		    return false;
//		  }
//	  }
	  var cartBoxContent = `
	            <img src="${productImg}" alt="" class="cart-img">
	            <div class="detail-box">
	            <div class="cart-product-title">${title}</div>
	            <div class="cart-price">${price}</div>
	            <input type="number" value="1" class="cart-quantity">
	            </div>
	            <!--remove cart-->
	            <i class='bx bxs-trash-alt cart-remove' data='${title}' ></i>`;
	    cartShopBox.innerHTML = cartBoxContent;
	    cartItems.append(cartShopBox);
	    cartShopBox.getElementsByClassName('cart-remove')[0]
	    .addEventListener('click',removeCartItem);
	    cartShopBox.getElementsByClassName('cart-quantity')[0]
	    .addEventListener('change',quantityChanged);
	 return true;
}
//update total
function updatetotal() {
//    var cartContent = document.getElementsByClassName('cart-content')[0];
//    var cartBoxes = cartContent.getElementsByClassName('cart-box');
//    var total=0;
//    for(var i = 0; i < cartBoxes.length; i++) {
//        var cartBox = cartBoxes[i];
//        var priceElement = cartBox.getElementsByClassName('cart-price')[0];
//        var quantityElement = cartBox.getElementsByClassName('cart-quantity')[0];
//        var price = parseFloat(priceElement.innerText.replace("₩", ""));
//        var quantity = quantityElement.value;
//        total = total + price * quantity;
//      }
//        total = Math.round(total * 100) / 100;
//        document.getElementsByClassName('total-price')[0].innerText = "₩" + total;
 }
 
 
 
 
 
 // 세션에 카트 추가하기
 function addCart(isbn, total=1, img) {
	 
	 $(".cart").addClass("active");
	 
	 const url = root + "/addCart"
	 
	 const data = {
		 'isbn'  : isbn,
		 'total' : total,
		 'img' :	img
	 }
	 
	 $.ajax({
        type            : 'GET',                 // 요청 메소드
        url             :  url,                    // 요청 URL
        data            :  data,                   // 요청 데이터
        contentType     : 'application/json',      // 요청 데이터 타입
        dataType        : 'html',                 // 응답 데이터 타입
        // 요청 성공 
        success         : function(response, status) {
            // response : 응답 데이터
            // status   : 응답 상태
            // alert(response)
            updateCartList()
        },
        // 에러
        error           : function(xhr, status) {
            // xhr      : XMLHttpRequest 객체
            // status   : 응답 상태
            alert('에러 발생')
        }
        
    })
 }
 
 
 // 세션에서 카트 가져오기
 async function getCartList() {
	 const url = root + "/cartList"
	 let cartList
	 
	 return new Promise((resolve, reject) => {
		 $.ajax({
	        type            : 'GET',                 // 요청 메소드
	        url             :  url,                    // 요청 URL
	//        data            :  data,                   // 요청 데이터
	//		async			: false,
	        contentType     : 'application/json',      // 요청 데이터 타입
	        dataType        : 'html',                 // 응답 데이터 타입
	        // 요청 성공 
	        success         : function(response, status) {
	            // response : 응답 데이터
	            // status   : 응답 상태
	            // alert(response)
				if(response=='ADDCART'){
            		alert("장바구니에 1권 추가되었습니다.")
				}
	            let result = JSON.parse(response)
	            if( result == 0 ) return result
	            cartList = result.data
	            resolve(cartList)
	//            return cartList
	
	        },
	        // 에러
	        error           : function(xhr, status) {
	            // xhr      : XMLHttpRequest 객체
	            // status   : 응답 상태
	            // alert('에러 발생')
	            reject('에러 발생')
	        }
	    })
		 
		 
	 })
 }
 
  // 장바구니 세션에서 삭제
		function cartRemove(bname){
   			const check = confirm('장바구니에서 삭제하시겠습니까?')
   			
   			if (!check ) return
   			
   			const url = root + "/removeCart"
   		 
   			const data = { 'bname'  : bname }
   		 
   			$.ajax({
   	        type            : 'GET',                 // 요청 메소드
   	        url             :  url,                    // 요청 URL
   	        data            :  data,                   // 요청 데이터
   	        contentType     : 'application/json',      // 요청 데이터 타입
   	        dataType        : 'html',                 // 응답 데이터 타입
   	        // 요청 성공 
   	        success         : function(response, status) {
   	            // response : 응답 데이터
   	            // status   : 응답 상태
   	            // alert(response)
   	            updateCartList()
   	        },
   	        // 에러
   	        error           : function(xhr, status) {
   	            // xhr      : XMLHttpRequest 객체
   	            // status   : 응답 상태
   	            alert('에러 발생')
   	        }
   		 })
   		}
 
 // 장바구니 갱신
 async function updateCartList() {
	 getCartList().then(function(cartList) {
		 let cartContent = ''
		 if( cartList != null ) {
			 for( let i = 0 ; i < cartList.length ; i++ ) {
				 let cart = cartList[i]
				 let cartBox = `
				 				<div class="cart-box" id="${ cart.title }">
						           <img src="${cart.img}" alt="" class="cart-img">
						            <div class="detail-box">
							            <div class="cart-product-title">${ cart.title }</div>
							            <div class="cart-totla">1 권</div>
						            </div>
						            <!--remove cart-->
						            <i class="bx bxs-trash-alt cart-remove" data="${ cart.title }" ></i>
					            </div>
				 				`
				 cartContent += cartBox
			 }
		 }
		 else {
			 return
		 }
		 $('.cart-content').html(cartContent)
		 
	 })
	 
 }