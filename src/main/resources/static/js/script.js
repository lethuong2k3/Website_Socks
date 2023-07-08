$(document).ready(function() {
    $('.slider').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 3,
        prevArrow:"<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
        nextArrow:"<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>"
    });
});
// <c:if test="${paySuccess}">
//     $(document).ready(function() {
//         swal({
//             title: "Mua hàng thành công",
//             icon: "success",
//             button: "OK",
//         });
//     });
// </c:if>
// <c:if test="${registerSuccess}">
//     $(document).ready(function() {
//         swal({
//             title: "Đăng ký thành công",
//             text: "Vui lòng đăng nhập",
//             icon: "success",
//             button: "OK",
//         });
//     });
// </c:if>
if ('/*[[${session.userLogin}]]*/' !== 'null') {
    const wrapper = document.querySelector('.wrapper');
    const loginLink = document.querySelector('.login-link');
    const registerLink = document.querySelector('.register-link');
    const btnPopup = document.querySelector('.btnLogin-popup');
    const iconClose = document.querySelector('.icon-close');
    registerLink.addEventListener('click', ()=> {
        wrapper.classList.add('active');
    });

    loginLink.addEventListener('click', ()=> {
        wrapper.classList.remove('active');
    });

    btnPopup.addEventListener('click', ()=> {
        wrapper.classList.add('active-popup');
    });

    iconClose.addEventListener('click', ()=> {
        wrapper.classList.remove('active-popup');
    });
}

