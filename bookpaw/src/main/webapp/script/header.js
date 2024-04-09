const toggleBtn = document.querySelector('.navbar_toogleBtn');
const menu = document.querySelector(".nav_list");
const icons = document.querySelector('.navbar_icon');

toggleBtn.addEventListener('click',()=>{
	menu.classList.toggle('active');
	icons.classList.toggle('active');
});
