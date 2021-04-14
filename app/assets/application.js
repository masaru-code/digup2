window.addEventListener('load', function() {
  document.querySelector('.check').addEventListener('click', function(e) {
    //alert('clicked!');
    this.closest('tr').classList.add('back-color');
    });
  });