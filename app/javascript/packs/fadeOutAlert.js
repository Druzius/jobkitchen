function fadeOutAlert() {
  setTimeout(function(){
    $('.notification').slideUp(1500);
  }, 1000);
};

export { fadeOutAlert }
