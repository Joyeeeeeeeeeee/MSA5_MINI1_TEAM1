const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');
const btnPopup = document.querySelector('.btnLogin-popup');
const iconClose = document.querySelector('.icon-close');

registerLink.addEventListener('click', () => {
    wrapper.classList.add('active');
});
loginLink.addEventListener('click', () => {
    wrapper.classList.remove('active');
});
btnPopup.addEventListener('click', () => {
    wrapper.classList.add('active-popup');
});
iconClose.addEventListener('click', () => {
    wrapper.classList.remove('active-popup');
});

document.getElementById('file1').addEventListener('change', function() {
    var reader = new FileReader();
    reader.onload = function(e) {
        document.getElementById('previewImage').src = e.target.result;
        document.getElementById('previewImage').style.display = 'block';
    }
    reader.readAsDataURL(this.files[0]);
});


  $(document).ready(function(){
                 $('.img_list li').last().prependTo('.img_list');
                 $('.img_list').css('left',-500);
                setInterval(function(){
                    $('.img_list').animate({left:'-='+500},'slow',function(){
                    $('.img_list li') .first().appendTo('.img_list');
                    $('.img_list').css('left',-500);
                     }
                  );
                },2000);
              }
            );
