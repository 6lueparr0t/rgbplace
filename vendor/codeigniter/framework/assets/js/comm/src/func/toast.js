const toast = Swal.mixin({
    toast: true,
    position: 'bottom-end',
    background: (document.querySelector('body').classList.contains('dark'))?'#495057':'#fff',
    showConfirmButton: false,
    timer: 2000
});
