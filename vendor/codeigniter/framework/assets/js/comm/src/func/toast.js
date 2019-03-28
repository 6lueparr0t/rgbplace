let background = (document.querySelector('body').classList.contains('dark'))?'#495057':'#fff';

const toast = Swal.mixin({
    toast: true,
    position: 'bottom-end',
    background: background,
    showConfirmButton: false,
    timer: 2000
});
